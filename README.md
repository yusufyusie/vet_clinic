<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📗 Table of Contents](#-table-of-contents)
- [📖 \[Vet Clinic Database\] ](#-vet-clinic-database-)
  - [🛠 Built With ](#-built-with-)
    - [Tech Stack ](#tech-stack-)
    - [Key Features ](#key-features-)
  - [💻 Getting Started ](#-getting-started-)
    - [Prerequisites](#prerequisites)
    - [Setup](#setup)
    - [Usage](#usage)
  - [👥 Authors ](#-authors-)
  - [🔭 Future Features ](#-future-features-)
  - [🤝 Contributing ](#-contributing-)
  - [⭐️ Show your support ](#️-show-your-support-)
  - [🙏 Acknowledgments ](#-acknowledgments-)
  - [❓ FAQ ](#-faq-)
  - [📝 License ](#-license-)

<!-- PROJECT DESCRIPTION -->

# 📖 [Vet Clinic Database] <a name="about-project"></a>

Vet Clinic Database is a relational database to store animals' information, insert data nd query data for processing

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->
### Key Features <a name="key-features"></a>
- **Database named vet-clinic**
- **Table named animal**
- **Run relevant queries to fetch data from the database**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

This repository includes files with plain SQL that can be used to recreate a database:

- Use [schema.sql](./schema.sql) to create all tables.
- Use [data.sql](./data.sql) to populate tables with sample data.
- Check [queries.sql](./queries.sql) for examples of queries that can be run on a newly created database.

 **Important note: this file might include queries that make changes in the database (e.g., remove records). Use them responsibly!**

### Prerequisites

- Postgresql@16:

To install run:

 On Linux:
 
```sh
 sudo apt-get install postgresql postgresql-contrib libpq-dev
```

On Windows

Go to [postgres website](https://www.postgresql.org/) and download the installer and follow the installation process

### Setup

Clone this repository to your desired folder:

```sh
  git clone git@github.com/yusufyusie/vet-clinic
  cd vet-clinic
```
### Usage

To run the project, start the Postgresql server first, connect with vet_clininc database and execute the following commands on terminal:

```sh
  $ brew services restart postgresql@14
  $ psql postgres

  postgres=# CREATE DATABASE vet_clininc;
  CREATE DATABASE

  postgres=# \c vet_clininc;
  CREATE DATABASE

```

Exit sql by running 

```sh


postgres=# \q

```
Reconnect with database by

```sh

$ psql vet_clinic

=======

postgres=# \q

```
Reconnect with database by

```sh

$ psql vet_clinic
```
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Yesuf Fenta**

- GitHub: [@yusufyusie](https://github.com/yusufyusie)
- Twitter: [@yusufyusiee](https://twitter.com/yusufyusiee)
- LinkedIn: [yusufyusie](https://linkedin.com/in/yusufyusie)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- [ ] **Add Column To Table**
- [ ] **Create Bridge Table**
- [ ] **Add Join queries**
- [ ] **Add multiple tables**
<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>
If you like this project please don't forget to give me a star

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank microverse for providing me with the template for this project

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FAQ (optional) -->

## ❓ FAQ <a name="faq"></a>


- **[Why I use this repository app?]**

  - [To create the database for vet_clinic]

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.
<p align="right">(<a href="#readme-top">back to top</a>)</p>
<p align="right">(<a href="#readme-top">back to top</a>)</p>
