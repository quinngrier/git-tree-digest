
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

  tree_object=`
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

  object_list=`
    'eval' "${GIT}"' \
      '\''rev-list'\'' \
      '\''--objects'\'' \
      "${tree_object}" \
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

  object_list=`
    'sed' \
      's/[	 ].*//' \
      0<<EOF \
    ;
${object_list}
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

  object_list=`
    'sort' \
      0<<EOF \
    ;
${object_list}
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

  digest_list=`
    'exec' 3>&1
    es1=\`
      {
        {
          for object in ${object_list}; do
            'eval' "${GIT}"' \
              '\''cat-file'\'' \
              '\''-p'\'' \
              "${object}" \
            ;'
            es="${?}"
            case "${es}" in
              '0')
              ;;
              *)
                'break'
              ;;
            esac
          done
          'echo' "${es}"' ' 1>&4
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

  digest_list=`
    'sed' \
      '
        s/A/a/g
        s/B/b/g
        s/C/c/g
        s/D/d/g
        s/E/e/g
        s/F/f/g
        s/^\([0-9a-f]\{16,\}\).*$/\1/
        s/^.*[^0-9a-f]\([0-9a-f]\{16,\}\).*$/\1/
      ' \
      0<<EOF \
    ;
${digest_list}
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
