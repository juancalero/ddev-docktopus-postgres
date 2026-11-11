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

The seed script `postgres-init/init.sql` (created at the project root on install if missing) runs only the first time the data volume is created. It creates a `user` table with demo rows, matching the API's `/api/users` endpoint.

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

The generated `postgres-init/init.sql` is removed if unmodified. The data volume (`ddev-<project>_node_postgres_data`) is not deleted automatically.

## License

GPL-2.0-or-later
