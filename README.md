# Capstone Pomodoro Task Tracker Client

## Links

[Production Application Client](https://matthewjmontalto.github.io/capstone-pomodoro-task-tracker-client/#/) |
[Production Application API](https://pomodoro-task-tracker-api.herokuapp.com/) |
[Application Client Repository](https://github.com/matthewjmontalto/capstone-pomodoro-task-tracker-client)


## Description

The pomodoro task tracker allows users to create an account and track their
daily tasks. When the time comes to begin working on a task, a user can utilize
a timer that complies with the pomodoro time management strategy. The timer
will start at 25 minutes. When the timer expires, it will switch to a 5-minute break
period. Then, when the break period expires, the timer will switch back to a
25-minute countdown, signifying the next pomodor round. Users may utilize
however many rounds necessary to complete a task.

When creating a task, users must provide a title, description, and date.
Optional fields include a difficulty level, which will store any number provided,
so as to allow for flexibility.

Tasks may be edited or deleted at any time when viewing the detail screen for a
given task. However, tasks may be switched to completed while viewing the task
from the task list.

## Technologies In Use

### API
-   Ruby
-   Ruby on Rails
-   ActiveRecord
-   PostgreSQL

## Unsolved Problems

1.  When a timer expires, a patch request is sent to the server to update the number of rounds. Serving this action when the component unmounts would be more efficient, but this can be inturrupted. Future state will involve a means to pause the unmount until the api returns a response.


## Planning, Process, and Problem Solving

It was determined from the outset of the project that the client would be built using React. The initial plan began by deciding what type of database would best support the nature of data produced by this application. Given the predictable nature of the data, a relational database supported by Ruby on Rails was chosen.

Establishing the databse and setting up the back-end of the application came first, as this would determine how the client would connect to the available routes. Curl scripts were used to test the routes on th eback end and generate a user.

After the back-end was established, work on the front end began with connecting crud actions to the databse. Once actions were verified to work using curl scripts, basic components were built to begin displaying data.

Any problems or challenges that occurred were addressed immediately using a number of methods:
-   debugging and logging data to the console.
-   researching error messages
-   reviewing documentation
-   searching stack overflow for similar issues

## Entity-Relation Diagram
`User -|---< Tasks`

## Routes

### Authentication
| VERB | PATH | PARAMETERS |
|:-----:|:---:|:----------:|
| POST  | /sign-up  | `credentials` containing `email`, `password`, `password_confirmation`  |
| POST | /sign-in | `credentials` containing `email` and `password` |
| PATCH  | /change-password  | `passwords` containing `old` and `new` (requires Authorization header)  |
| DELETE  | /sign-out  | None (requires Authorization header) |

### Tasks

| VERB | PATH | PARAMETERS |
|:----:|:----:|:----------:|
| GET | /tasks  | None (requires Authorization header)  |
| POST | /tasks  | `task` containing `title`, `description`, `date`, `complted`, `difficulty`, `number_pomodoro_sessions`. (requires Authorization header)  |
| PATCH  | /tasks/:id  |  task containing title, description, date, complted, difficulty, number_pomodoro_sessions. (requires Authorization header) |
| DELETE | /tasks/:id  | none (requires Authorization header)  |
## Set-up

1.  fork and clone this repository
2.  navigate to the project directory and run `git init`
2.  Open your terminal and run `bundle install` to install dependencies
3.  Create a `.env` for sensitive settings (`touch .env`).
4. Generate new `development` and `test` secrets (`bundle exec rails secret`).
5. Store them in `.env` with keys `SECRET_KEY_BASE_DEVELOPMENT=[SECRET]` and `SECRET_KEY_BASE_TEST=[SECRET]` respectively.
6. In order to make requests to your production API, you will need to set `SECRET_KEY_BASE` in the environment of the production API
7. Navigate your browser to `localhost:4147` to view your database. This may not be accessible if you are using ProtectedController in the tasks controller 

### set up database

```
- bin/rails db:drop (if it already exists)
- bin/rails db:create
- bin/rails db:migrate
- bin/rails db:seed
- bin/rails db:examples
```

### Run local server
`bin/rails server` or `undle exec rails server.`
