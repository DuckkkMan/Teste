# Teste — Roblox + GitHub Token Auth

A tiny learning prototype that checks a Roblox server-side test token against a JSON file hosted in this GitHub repository.

## Files

- `tokens.json` — list of accepted test tokens.
- `Roblox/ServerAuth.server.lua` — Roblox server Script example.

## GitHub raw URL

`https://raw.githubusercontent.com/DuckkkMan/Teste/main/tokens.json`

## Roblox setup

1. In Roblox Studio, create a normal **Script** inside `ServerScriptService`.
2. Copy the contents of `Roblox/ServerAuth.server.lua` into it.
3. In **Game Settings → Security**, enable **Allow HTTP Requests**.
4. Run the game and check the Output window for `AUTHORIZED` or `DENIED`.

The script uses `HttpService:GetAsync()`. It does not use Roblox's `require()`; a GitHub URL is not a Roblox ModuleScript asset ID.

## Change the test token

Edit `tokens.json` and add/remove strings in the `tokens` array. In the Roblox Script, set `SToken` to the value you want to test.

Example:

```json
{
  "tokens": [
    "TESTE-1234",
    "OUTRO-TOKEN"
  ]
}
```

## Important limitations

This repository is public, so the token list is public too. Anyone can read it and copy a token. This demonstrates fetching and comparing data only; it is **not secure authentication** and should not control valuable rewards, admin powers, purchases, or other protected game actions.

The comparison happens inside the Roblox server after it downloads the JSON file. GitHub is only hosting the data; it is not running code or validating requests.
