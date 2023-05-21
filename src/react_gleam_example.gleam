import gleam/int
import gleam/list
import react_gleam.{component, render}
import react_gleam/element.{button, div, text}
import react_gleam/event
import react_gleam/hook

pub fn main() {
  render(app(), "#root")
}

fn app() {
  items()
}

fn item() {
  use <- component()
  let #(c, set_c) = hook.use_state(fn(_) { 0 })

  div(
    [],
    [
      button(
        [event.on_click(fn(_) { set_c(fn(prev) { prev + 1 }) })],
        [
          text("item:"),
          text(
            c
            |> int.to_string,
          ),
        ],
      ),
    ],
  )
}

fn items() {
  use <- component()

  let #(n, set_n) = hook.use_state(fn(_) { 0 })
  let handle_click = event.on_click(fn(_) { set_n(fn(prev) { prev + 1 }) })

  div(
    [],
    [
      button([handle_click], [text("add")]),
      div(
        [],
        list.repeat(0, n)
        |> list.map(fn(_) { item() }),
      ),
    ],
  )
}
