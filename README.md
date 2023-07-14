# xsd2jar

### description

This will analyze a list of directories in an `XSD` and convert each one to a `JAR`` file. 

Since it works on a `docker container` basis, it doesn't have to take into account the java version of the host machine.

### how to use

1. Inside the `xsd` directory, place the files you want to convert. An example is shown below.

```
./xsd
├── animals
│   ├── Cat.xsd
│   ├── Dog.xsd
├── students
    ├── Liam.xsd
    └── John.xsd
```

2. You must have [docker](https://docs.docker.com/get-docker/) installed.

3. Clone the `xsd2jar` project.
```
git@github.com:kimjbstar/xsd2jar.git
```

3. Run the container via `docker compose up`.

4. Verify that the directory and the `jar` files of the same name have been created.

```
./xsd
├── animals
│   ├── Cat.xsd
│   ├── Dog.xsd
├── students
│   ├── Liam.xsd
│   └── John.xsd
├── animals.jar
└── students.jar
```