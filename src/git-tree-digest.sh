
#
# The nl variable holds a newline character. It can be used where a
# literal newline character might be awkward.
#

nl='
'
'readonly' 'nl'

GIT='git'
'readonly' 'GIT'

OPENSSL=''\''openssl'\'''

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

  tree_hash=`
    'eval' "${GIT}"' \
      '\''rev-parse'\'' \
      '\''--verify'\'' \
      "${1}"'\''^{tree}'\'' \
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

  hash_list=`
    'eval' "${GIT}"' \
      '\''rev-list'\'' \
      '\''--objects'\'' \
      "${tree_hash}" \
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

  hash_list=`
    'sed' \
      's/[	 ].*//' \
      0<<EOF \
    ;
${hash_list}
EOF
  `
  es="${?}"
  case "${es}" in
    '0')
    ;;
    *)
      'exit' "${es}"
    ;;
  esac

  hash_list=`
    'sort' \
      0<<EOF \
    ;
${hash_list}
EOF
  `
  es="${?}"
  case "${es}" in
    '0')
    ;;
    *)
      'exit' "${es}"
    ;;
  esac

  digest_list=''

  for hash in ${hash_list}; do

    digest_list="${digest_list}""${nl}"`
      'exec' 3>&1
      es1=\`
        {
          {
            'eval' "${GIT}"' \
              '\''cat-file'\'' \
              '\''-p'\'' \
              "${hash}" \
            ;'
            'echo' "${?}"' ' 1>&4
          } | 'eval' "${OPENSSL}"' \
            '\''dgst'\'' \
            '\''-sha512'\'' \
            1>&3 \
          ;'
        } 4>&1
      \`
      es2="${?}"
      case "${es1}" in
        '0 ')
        ;;
        *' ')
          'exit' ${es1}
        ;;
        *)
          'exit' '1'
        ;;
      esac
      case "${es2}" in
        '0')
        ;;
        *)
          'exit' "${es2}"
        ;;
      esac
      'exit' '0'
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
