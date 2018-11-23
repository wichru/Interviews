# Requirements

- Ruby 2.2.2
- Postgres

# Task
Company _AwesomeQuestionnaires_ wants to create a simple web application for managing their Questionnaires.
They want to give their customers some cutting-edge features like putting Questions into Questionnaires
in a specified order, giving Answers to each of the Questions in the Questionnaire etc.
So, as they want to provide the best quality solution for the problem, they contacted you, a well-known and
renowned developer and sent you a high-level list of their requirements:

1. There is a possibility to fill the Questionnaire by answering it's Questions.
1. There is a possibility of generating a report of a Questionnaire
1. There is a possibility of getting a list of Questions of a Questionnaire.
1. There is a possibility of adding a Question to a Questionnaire.
1. There is a possibility of removing any Question from a Questionnaire.

You glance over the requirements and decide that the first step is to focus on the foundations...

## Structure, services and report (part1)

Your first task is to:
* create `Question` and `Questionnaire` models (and their corresponding tables)
  * `Question` must have a `content` field, which contains the question itself
  * `Questionnaire` must have a `name` field
* find a way to link `Questions` to `Questionnaires`

After tasks above are finished, complete the following services:
* FetchQuestionsFromQuestionnaire
Complete class `FetchQuestionsFromQuestionnaire`, which responsibility is to fetch Questions of a Questionnaire.
Running `.call` method should return an object that is an instance of an Array.
Elements of this array should be Question instances. Ordering is not relevant here.

* AddQuestionToQuestionnaire
Complete class `AddQuestionToQuestionnaire`. This class' responsibility is to add the given Question
to the Questionnaire. After running this class for a Question, this Question should now appear
in the list returned by FetchQuestionsFromQuestionnaire.

* RemoveQuestionFromQuestionnaire
Complete class `RemoveQuestionFromQuestionnaire`, which responsibility is to remove
the Question from the Questionnaire. After running this class for a Question, this Question should not appear
in the list retuned by FetchQuestionsFromQuestionnaire anymore. If the given Question does not exist in the Questionnaire,
then `ActiveRecord::RecordNotFound` should be returned.

Then:
* create `Answer` model which will hold answer of a Question in a Questionnaire
  * an answer must have `value` property, which can only contain words "yes" or "no". This property cannot be empty.
  * we also want to know when the answer was given, so make sure timestamps are present
* complete the service `AddAnswerToQuestion`, which after being given Questionnaire, Question and an Answer, will
  add this Answer to the Question in this Questionnaire. If the given Question is not linked to the Questionnaire
  then the service should fail.
* fill method `.call` of class QuestionnaireReport, which should count and group all the answers given
  to the Questionnaire's Questions. Returned hash should have a following format:
  `{ "questionnaire_name": { "yes": 3, "no": 2, "not_answered": 1 } }`

For each of the above (models and services) there are tests located in `spec/part1`. Use them to validate your solution!
Please note that due to the structure of the task, services tests are dependent on each other, that is, it's possible
you'll have to implement them all for any service tests to pass.

Note: there are many possible solutions and many of them are good :)

## Ordering (part2)

After developing the foundations, the company decided it's time to add the ordering functionality...

### Modify the structure
Modify the structure of your models in such way that it allows to store Questions in a Questionnaire in a particular order.
The structure should allow to freely add and remove Questions to / from any place in a Questionnaire.

* FetchQuestionsFromQuestionnaire
Modify class `FetchQuestionsFromQuestionnaire` so that it returns the Questions of a Questionnaire in
an order.

* AddQuestionToQuestionnaire
Modify class `AddQuestionToQuestionnaire`, so that it allows to put the given Question
inside the Questionnaire in a place specified in the parameter and update the positions of other Questions accordingly.
If no place is given, then the Question should be put as the last one in the Questionnaire.

* RemoveQuestionFromQuestionnaire
Modify class `RemoveQuestionFromQuestionnaire`, so that after removing a question it updates the positions
of other Questions.

For each of the above (updated models and services) there are tests located in `spec/part2`. Use them to validate your solution!
Make sure tests for part1 should pass also!

# Configuration

## Setup
```
bundle # install gems
```

## DB
```
$ bin/rake db:create # create the db
$ bin/rake db:migrate # run migrations
$ bin/rake db:migrate APP_ENV=test # run migrations for test environment
$ bin/rake db:drop # delete the db
$ bin/rake db:reset # combination of drop, create and migrate
$ bin/rake db:schema # creates a schema file of the current database
$ bin/rake g:migration your_migration # generates a new migration file
```

## Tests
```
$ bin/rspec # run tests
```
