# production_line_report

TODO: Write a description here

## Installation

1. Follow [this](https://crystal-lang.org/install/) page install Crystal, after install sucessful, you should run `crystal`, `shards` command sucessful.
2. [Optional] Follow [this](https://luckyframework.org/guides/getting-started/installing) install lucky command, this step only needed if you want rollback db/migrations etc.
3. Run `shards` to install dependencies into `./lib`
4. Start pg server sucessful.
5. Run `lucky db.create` create database.

## Usage

1. run `shards run` to start server.
2. Visit `localhost:3000`.

## Deployment

1. For built a static bianry which can be run any linux distro, you must use Docker, more details will add later.

2. For built on ARM device, use following command.

```sh
crystal build --cross-compile --target arm-linux-gnueabihf src/production_line_report.cr
```

Then run the generated `cc` command in ARM device.

## Contributing

1. Fork it (<https://github.com/zw963/production_line_report/fork>)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## Contributors

- [Billy.Zheng](https://github.com/zw963) - creator and maintainer
