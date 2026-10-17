# BELZEBU

<p align="center">
  <img src="https://raw.githubusercontent.com/comprometeu/belzebu_cnc/main/logo.jpg" alt="Belzebu Logo" width="220">
</p>

<p align="center">
  <strong>Installation • MySQL / MariaDB • SQLite • Docker</strong>
</p>

---

## Requirements

- Linux VPS with root access
- Docker
- MariaDB (only when using MySQL)
- Existing `main` executable in the project directory

## 1. Clone the repository

```bash
git clone https://github.com/comprometeu/belzebu_cnc
cd belzebu_cnc
```

> Make sure the `main` executable is already present in the project directory.

---

## 2. Choose your database

### MySQL / MariaDB — Default

#### 2.1. Install MariaDB

```bash
apt update
apt install -y mariadb-server
systemctl enable --now mariadb
```

#### 2.2. Create the database and user

```bash
mariadb <<'SQL'
CREATE DATABASE IF NOT EXISTS belzebu
  CHARACTER SET utf8mb4
  COLLATE utf8mb4_unicode_ci;

CREATE USER IF NOT EXISTS 'belzebu'@'localhost'
  IDENTIFIED BY 'pass123';

ALTER USER 'belzebu'@'localhost'
  IDENTIFIED BY 'pass123';

CREATE USER IF NOT EXISTS 'belzebu'@'127.0.0.1'
  IDENTIFIED BY 'pass123';

ALTER USER 'belzebu'@'127.0.0.1'
  IDENTIFIED BY 'pass123';

GRANT ALL PRIVILEGES ON belzebu.* TO 'belzebu'@'localhost';
GRANT ALL PRIVILEGES ON belzebu.* TO 'belzebu'@'127.0.0.1';

FLUSH PRIVILEGES;
SQL
```

> Replace `pass123` with a strong password and use the same password in your application configuration.

#### 2.3. Configure MySQL

Edit `config/belzebu.json` and configure the following values:

```json
{
  "database": {
    "type": "mysql",
    "address": "127.0.0.1:3306",
    "username": "belzebu",
    "password": "YOUR_STRONG_PASSWORD",
    "table": "belzebu"
  },
  "connection": {
    "server version": "",
    "port": 38471
  },
  "api": {
    "enabled": true,
    "port": 38470
  }
}
```

**Important:** This is only the relevant configuration excerpt. Preserve the other required settings in your existing `config/belzebu.json`, including `key`, `webhook`, `fakecount`, and `branding`.

#### 2.4. Start the application

Run the following commands from the project directory:

```bash
docker rm -f belzebu 2>/dev/null || true

docker run -d \
  --name belzebu \
  --restart unless-stopped \
  --network host \
  -v "$PWD:/app" \
  -w /app \
  debian:trixie \
  ./main
```

The container uses host networking to connect to MariaDB through `127.0.0.1:3306`.

**MySQL ports**

| Service | Port |
|---|---:|
| Application connection | `38471` |
| HTTP API | `38470` |
| MariaDB | `3306` — local database |

---

<details>
<summary><strong>SQLite — Alternative database</strong></summary>

SQLite does not require a separate database server. Data is stored in a local database file.

#### A. Create the data directory

```bash
mkdir -p data
```

#### B. Configure SQLite

Edit `config/belzebu.json` and set the following values:

```json
{
  "database": {
    "type": "sqlite",
    "address": "./data/belzebu.db"
  },
  "connection": {
    "server version": "",
    "port": 38571
  },
  "api": {
    "enabled": true,
    "port": 38570
  }
}
```

**Important:** This is only the relevant configuration excerpt. Preserve the other required settings in your existing configuration file.

#### C. Start the application

```bash
docker rm -f belzebu 2>/dev/null || true

docker run -d \
  --name belzebu \
  --restart unless-stopped \
  --network host \
  -v "$PWD:/app" \
  -w /app \
  debian:trixie \
  ./main
```

The `data/` directory is stored on the host, so the database persists when the container is removed.

**SQLite ports**

| Service | Port |
|---|---:|
| Application connection | `38571` |
| HTTP API | `38570` |

</details>

---

## 3. Check the container

Check the container status:

```bash
docker ps -a --filter name=belzebu
```

View the latest logs:

```bash
docker logs --tail 50 belzebu
```

Follow logs in real time:

```bash
docker logs -f belzebu
```

Press `Ctrl+C` to exit the log viewer without stopping the application.

## 4. Container management

| Action | Command |
|---|---|
| Start | `docker start belzebu` |
| Stop | `docker stop belzebu` |
| Restart | `docker restart belzebu` |
| View logs | `docker logs --tail 100 belzebu` |
| Follow logs | `docker logs -f belzebu` |
| Remove container | `docker rm -f belzebu` |

Removing the container does not delete the project directory or its stored database.

## 5. Security

- Replace the example database password before production use.
- Do not expose MariaDB port `3306` to the public internet.
- Restrict application ports using your firewall.
- Back up your database regularly.
- Keep `config/license.key` valid if required by the application.

---

<p align="center">
  <strong>BELZEBU</strong><br>
  <sub>Installation and Configuration Guide</sub>
</p>