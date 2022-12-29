Nerves + LiveView Starter Project
===

This is a (slightly opinionated) starter project for Nerves that includes Phoenix/LiveView.

Currently the versions included are:

* `nerves`  - 1.9.1
* `phoenix`  - 1.6.15
* `phoenix_liveview` - 0.18.3
* `tailwindcss` - 0.1.9

Setup
---

To get started, first replace the following strings throughout the project:

* `ReplaceMeApp` -> `YourAppName`
* `replace_me_app` -> `your_app_name`

```bash
# Might be necessary in MacOS to avoid a sed "illegal byte sequence" error
# export LC_CTYPE=C 
# export LANG=C

find . -type f \( -iname "*.ex*" ! -path "./deps/*" ! -path "./_build/*" \) -print0 | xargs -0 sed -i '' -e 's/ReplaceMeApp/YourAppName/g'
find . -type f \( -iname "*.ex*" ! -path "./deps/*" ! -path "./_build/*" \) -print0 | xargs -0 sed -i '' -e 's/replace_me_app/your_app_name/g'
sed -i '' 's/replace_me_app/your_app_name/g' ./scripts/deploy.sh
```

Then rename the files and directories in lib:

```bash
mv lib/replace_me_app lib/your_app_name
mv lib/replace_me_app_web lib/your_app_name_web
mv lib/replace_me_app.ex lib/your_app_name.ex
mv liv/replace_me_app_web.ex lib/your_app_name_web.ex
```

Developing
---

You can start the application just like any Phoenix project:


```bash
iex -S mix phx.server
```


Flashing Device
---

You can burn the first image with the following commands:

```bash
MIX_ENV=prod MIX_TARGET=host mix do deps.get, assets.deploy
MIX_ENV=prod MIX_TARGET=rpi3 mix do deps.get, firmware, burn
```

Once the device is up and running there is a `deploy.sh` script that will build the app and flash it
over ssh.

