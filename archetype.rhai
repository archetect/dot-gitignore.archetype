let context = #{};

context.ignores = prompt("Ignore Categories:", #{
  type: MultiSelect([
    "Rust",
    "RustBinary",
    "RustLibrary",
    "Java",
    "JavaScript",
    "Python",
    "IDEA",
    "Eclipse",
    "VSCode",
    "Emacs",
    "Vim",
    "ReactJS",
    "NextJS",
    "Target",
  ]),
  answer_key: "ignore",
});

render(Directory("contents"), context, #{
  if_exists: overwrite_policy(),
});

fn overwrite_policy() {
  if switch_enabled("overwrite") {
    return Overwrite;
  } else if switch_enabled("prompt") {
    return Prompt;
  } else {
    return Preserve;
  }
}


