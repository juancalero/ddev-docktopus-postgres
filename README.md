[![tests](https://github.com/juancalero/ddev-docktopus-postgres/actions/workflows/tests.yml/badge.svg?branch=main)](https://github.com/juancalero/ddev-docktopus-postgres/actions/workflows/tests.yml)
[![release](https://img.shields.io/github/v/release/juancalero/ddev-docktopus-postgres)](https://github.com/juancalero/ddev-docktopus-postgres/releases/latest)

# DDEV Docktopus Postgres

[PostgreSQL 17](https://www.postgresql.org/) as an extra DDEV service, taken from the [docktopus](https://github.com/juancalero/docktopus) stack. It is the database for the Node API provided by [`ddev-docktopus-node-api`](https://github.com/juancalero/ddev-docktopus-node-api) — it does **not** replace DDEV's main `db` service.

> Part of [ddev-docktopus](https://github.com/juancalero/ddev-docktopus) — the meta add-on that installs the whole docktopus stack with one command.

## Installation

```
ddev add-on get juancalero/ddev-docktopus-postgres
ddev restart
```

## Configuration

All settings live in `.ddev/.env.ddev-docktopus-postgres`:

| Variable | Default | Description |
| --- | --- | --- |
| `POSTGRES_USER` | `nodeuser` | Database superuser |
| `POSTGRES_PASSWORD` | `nodepass` | Database password |
| `POSTGRES_DB` | `nodeapi` | Database created on first start |
| `POSTGRES_HOST_PORT` | `15432` | Host port for external clients |

Change any value and run `ddev restart`. Changing the credentials after the first start requires wiping the data volume (`ddev-<project>_node_postgres_data`).

## The seed script

The seed script `postgres-init/init.sql` (created at the project root on install if missing) runs only the **first** time the data volume is created. It creates a `user` table with 10 demo rows, matching the API's `/api/users` endpoint.

Edit it freely — it carries a `#ddev-generated` marker, so the add-on respects your changes. To re-run it, delete the data volume first:

```
docker volume rm ddev-<project>_node_postgres_data
ddev restart
```

## Access

| From | DSN |
| --- | --- |
| Node API container | `postgres:5432`, db `nodeapi`, user `nodeuser` |
| Host | `postgresql://nodeuser:nodepass@localhost:15432/nodeapi` |

## Uninstallation

```
ddev add-on remove ddev-docktopus-postgres
ddev restart
```

The generated `postgres-init/init.sql` is removed if unmodified. The data volume is not deleted automatically.

## License

GPL-2.0-or-later
