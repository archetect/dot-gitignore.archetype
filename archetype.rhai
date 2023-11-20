let context = #{};

context.ignores = prompt("Ignore Categories:", #{
  type: MultiSelect([
    "Rust",
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
  ]),
  answer_key: "ignore",
});

if context.ignores.contains("Rust") {
    context.rust_library = prompt("Is this a Rust library?", #{
      defaults_with: true,
      type: Bool, 
      optional: true,
      answer_key: "rust_library",
    });
}

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


