# Academy Quest App

A Rails application to manage quests with pending and completed status tracking.

---

## Table of Contents

- [Setup Instructions](#setup-instructions)
- [Features](#features)
- [Running Tests](#running-tests)

---

## Setup Instructions

1. **Clone the repository**  
   ```bash
   git clone https://github.com/danudeth2004/my_academy_quest.git
   cd my_academy_quest
   ```

2. **Install dependencies**

   ```bash
   bundle install
   ```

3. **Set up environment variables**

   ```bash
   touch .env
   code .env
   ```

   Add the following to `.env`:

   ```env
   DB_USERNAME={your_protgresql_user}
   DB_PASSWORD={your_protgresql_password}
   ```

4. **Setup the database**

   ```bash
   docker compose up -d db
   ```

5. **Start the development server**

   ```bash
   bin/dev
   ```

---

## Features

* Quest management (Create, Update, Delete)
* Status tracking for quests (Pending / Completed)

---

## Running Tests

### Run mini-test with:

```bash
rails test
```

Check coverage with simplecov:
```bash
open coverage/index.html
```

### Run system and integration tests with:

```bash
bundle exec rspec spec/system/**
bundle exec rspec spec/integration
```