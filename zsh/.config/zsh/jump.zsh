# ============================================================
# Jump
#
# Manually named filesystem marks.
# ============================================================

export MARKPATH="${MARKPATH:-$HOME/.marks}"


# ------------------------------------------------------------
# mark [name]
#
# Mark the current directory. If no name is given, use the
# current directory's basename.
# ------------------------------------------------------------

mark() {
  local name="${1:-${PWD:t}}"

  mkdir -p "$MARKPATH"

  if [[ -e "$MARKPATH/$name" || -L "$MARKPATH/$name" ]]; then
    echo "mark already exists: $name"
    return 1
  fi

  ln -s "$PWD" "$MARKPATH/$name"
}


# ------------------------------------------------------------
# jump <name>
# ------------------------------------------------------------

jump() {
  local name="$1"

  if [[ -z "$name" ]]; then
    echo "usage: jump <mark>"
    return 1
  fi

  local target="$MARKPATH/$name"

  if [[ ! -L "$target" && ! -d "$target" ]]; then
    echo "no such mark: $name"
    return 1
  fi

  builtin cd -P -- "$target"
}


# ------------------------------------------------------------
# unmark <name>
# ------------------------------------------------------------

unmark() {
  local name="$1"

  if [[ -z "$name" ]]; then
    echo "usage: unmark <mark>"
    return 1
  fi

  local target="$MARKPATH/$name"

  if [[ ! -L "$target" ]]; then
    echo "no such mark: $name"
    return 1
  fi

  rm -- "$target"
}


# ------------------------------------------------------------
# marks
# ------------------------------------------------------------

marks() {
  [[ -d "$MARKPATH" ]] || return 0

  local mark

  for mark in "$MARKPATH"/*(N@); do
    printf "%-20s -> %s\n" "${mark:t}" "${mark:A}"
  done
}


# ------------------------------------------------------------
# Completion
# ------------------------------------------------------------

_jump_marks() {
  [[ -d "$MARKPATH" ]] || return

  local -a marks
  marks=("${(@f)$(command ls -1 "$MARKPATH" 2>/dev/null)}")

  _describe "mark" marks
}

compdef _jump_marks jump
compdef _jump_marks unmark
