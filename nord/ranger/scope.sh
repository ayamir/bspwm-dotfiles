#!/bin/sh

set -o noclobber -o noglob -o nounset -o pipefail

IFS=$'\n'

# Script arguments
FILE_PATH="${1}"
PV_WIDTH="${2}"
PV_HEIGHT="${3}"
IMAGE_CACHE_PATH="${4}"
PV_IMAGE_ENABLED="${5}"
FILE_EXTENSION="${FILE_PATH##*.}"
FILE_EXTENSION_LOWER=$(echo ${FILE_EXTENSION} | tr '[:upper:]' '[:lower:]')

# Settings
HIGHLIGHT_SIZE_MAX=262143
HIGHLIGHT_TABWIDTH=8
HIGHLIGHT_STYLE='pablo'
PYGMENTIZE_STYLE='autumn'

handle_extension() {
  case "${FILE_EXTENSION_LOWER}" in
    a|ace|alz|arc|arj|bz|bz2|cab|cpio|deb|gz|jar|lha|lz|lzh|lzma|lzo|rpm|rz|t7z|tar|tbz|tbz2|tgz|tlz|txz|tZ|tzo|war|xpi|xz|Z|zip)
      atool --list -- "${FILE_PATH}" && exit 5
      bsdtar --list --file "${FILE_PATH}" && exit 5
      exit 1;;

    rar)
      unrar lt -p- -- "${FILE_PATH}" && exit 5
      exit 1;;

    7z)
      7z l -p -- "${FILE_PATH}" && exit 5
      exit 1;;

    pdf)
      pdftotext -l 10 -nopgbrk -q -- "${FILE_PATH}" - | fmt -w ${PV_WIDTH} && exit 5
      mutool draw -F txt -i -- "${FILE_PATH}" 1-10 | fmt -w ${PV_WIDTH} && exit 5
      exiftool "${FILE_PATH}" && exit 5
      exit 1;;

    torrent)
      transmission-show -- "${FILE_PATH}" && exit 5
      exit 1;;

    odt|ods|odp|sxw)
      odt2txt "${FILE_PATH}" && exit 5
      exit 1;;

    htm|html|xhtml)
      w3m -dump "${FILE_PATH}" && exit 5
      lynx -dump -- "${FILE_PATH}" && exit 5
      elinks -dump "${FILE_PATH}" && exit 5
      ;;
  esac
}

handle_image() {
  local mimetype="${1}"

  case "${mimetype}" in
    image/svg+xml)
      convert "${FILE_PATH}" "${IMAGE_CACHE_PATH}" && exit 6
      exit 1;;

    image/*)
      local orientation
      orientation="$( identify -format '%[EXIF:Orientation]\n' -- "${FILE_PATH}" )"
      if [[ -n "$orientation" && "$orientation" != 1 ]]; then
        convert -- "${FILE_PATH}" -auto-orient "${IMAGE_CACHE_PATH}" && exit 6
      fi
      exit 7;;

    video/*)
      ffmpegthumbnailer -i "${FILE_PATH}" -o "${IMAGE_CACHE_PATH}" -s 0 && exit 6
      exit 1;;

    application/pdf)
      pdftoppm -f 1 -l 1 -scale-to-x 1920 -scale-to-y -1 -singlefile -jpeg -tiffcompression jpeg -- "${FILE_PATH}" "${IMAGE_CACHE_PATH%.*}" && exit 6 || exit 1;;

    application/zip|application/x-rar|application/x-7z-compressed|application/x-xz|application/x-bzip2|application/x-gzip|application/x-tar)
      local fn=""; local fe=""
      local zip=""; local rar=""; local tar=""; local bsd=""
      case "${mimetype}" in
        application/zip) zip=1 ;;
        application/x-rar) rar=1 ;;
        application/x-7z-compressed) ;;
        *) tar=1 ;;
      esac
      { [ "$tar" ] && fn=$(tar --list --file "${FILE_PATH}"); } || { fn=$(bsdtar --list --file "${FILE_PATH}") && bsd=1 && tar=""; } || { [ "$rar" ] && fn=$(unrar lb -p- -- "${FILE_PATH}"); } || { [ "$zip" ] && fn=$(zipinfo -1 -- "${FILE_PATH}"); } || return
      fn=$(echo "$fn" | python -c "import sys; import mimetypes as m; [ print(l, end='') for l in sys.stdin if (m.guess_type(l[:-1])[0] or '').startswith('image/') ]" | sort -V | head -n 1)
      [ "$fn" = "" ] && return
      [ "$bsd" ] && fn=$(printf '%b' "$fn")
      [ "$tar" ] && tar --extract --to-stdout --file "${FILE_PATH}" -- "$fn" > "${IMAGE_CACHE_PATH}" && exit 6
      fe=$(echo -n "$fn" | sed 's/[][*?\]/\\\0/g')
      [ "$bsd" ] && bsdtar --extract --to-stdout --file "${FILE_PATH}" -- "$fe" > "${IMAGE_CACHE_PATH}" && exit 6
      [ "$bsd" ] || [ "$tar" ] && rm -- "${IMAGE_CACHE_PATH}"
      [ "$rar" ] && unrar p -p- -inul -- "${FILE_PATH}" "$fn" > "${IMAGE_CACHE_PATH}" && exit 6
      [ "$zip" ] && unzip -pP "" -- "${FILE_PATH}" "$fe" > "${IMAGE_CACHE_PATH}" && exit 6
      [ "$rar" ] || [ "$zip" ] && rm -- "${IMAGE_CACHE_PATH}"
      ;;
  esac
}

handle_mime() {
  local mimetype="${1}"

  case "${mimetype}" in
    text/* | */xml)
      if [[ "$( stat --printf='%s' -- "${FILE_PATH}" )" -gt "${HIGHLIGHT_SIZE_MAX}" ]]; then
        exit 2
      fi
      if [[ "$( tput colors )" -ge 256 ]]; then
        local pygmentize_format='terminal256'
        local highlight_format='xterm256'
      else
        local pygmentize_format='terminal'
        local highlight_format='ansi'
      fi
      highlight --replace-tabs="${HIGHLIGHT_TABWIDTH}" --out-format="${highlight_format}" --style="${HIGHLIGHT_STYLE}" --force -- "${FILE_PATH}" && exit 5
      exit 2;;

    image/*)
      img2txt --gamma=0.6 --width="${PV_WIDTH}" -- "${FILE_PATH}" && exit 4
      # exiftool "${FILE_PATH}" && exit 5
      exit 1;;

    video/* | audio/*)
      mediainfo "${FILE_PATH}" && exit 5
      exiftool "${FILE_PATH}" && exit 5
      exit 1;;
  esac
}

handle_fallback() {
  echo '----- File Type Classification -----' && file --dereference --brief -- "${FILE_PATH}" && exit 5
  exit 1
}

MIMETYPE="$( file --dereference --brief --mime-type -- "${FILE_PATH}" )"

if [[ "${PV_IMAGE_ENABLED}" == 'True' ]]; then
  handle_image "${MIMETYPE}"
fi

handle_extension
handle_mime "${MIMETYPE}"
handle_fallback

exit 1
