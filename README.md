relative to: https://github.com/brettkolodny/react-gleam/issues/13


1. First run `npm install` or `pnpm install`

2. Then if you are using gleam 0.28, you should replace `assert Ok(key) =` with `let assert Ok(key) =` yourself.

3. Finally run `gleam build && npx vite`
