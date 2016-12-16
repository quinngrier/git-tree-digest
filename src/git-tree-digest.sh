
GIT='git'
'readonly' 'GIT'

case "${#}" in
  '0')
    'set' 'dummy'
  ;;
  *)
    'set' 'dummy' "${@}"
  ;;
esac

while ':'; do

  'shift'

  case "${#}" in
    '0')
      'break'
    ;;
  esac

  commit_hash=`
    'eval' "${GIT}"' \
      '\''rev-parse'\'' \
      '\''--verify'\'' \
      "${1}"'\''^{commit}'\'' \
    ;'
  `
  es="${?}"
  case "${es}" in
    '0')
    ;;
    *)
      'exit' "${es}"
    ;;
  esac

done

'exit' '0'

#
# The authors of this file have waived all copyright and
# related or neighboring rights to the extent permitted by
# law as described by the CC0 1.0 Universal Public Domain
# Dedication. You should have received a copy of the full
# dedication along with this file, typically as a file
# named <CC0-1.0.txt>. If not, it may be available at
# <https://creativecommons.org/publicdomain/zero/1.0/>.
#
