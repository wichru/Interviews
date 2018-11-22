### Ruby Bootcamp Task ⛺

Cześć! Przed Tobą trzy krótkie zadania, które pozwolą nam zweryfikować 
Twoją podstawową znajomość Rubiego i SQL-a. Całość składa się z 
jednego algorytmu i dwóch zapytań SQL-owych. 

**Rozwiązania nie musisz wrzucać na swojego GitHuba.</br>Wystarczy, że wyślesz nam link do [gista](https://gist.github.com/) z algorytmem i zapytaniami.**

#### Zadania do rozwiązania:

##### Część pierwsza - algorytm

```
Napisz metodę enhancer przyjmującą jeden argument składający się tylko 
z liter a..z i A..Z. Metoda powinna zwracać ciąg znaków w konwencji:
  - kiedy parametrem jest 'abcd', metoda powinna zwracać 'Aaaa-Bbb-Cc-D',
  - kiedy parametrem jest 'abcdab', metoda powinna zwracać 'Aaaaaa-Bbbbb-Cccc-Ddd-Aa-B'

Więcej przykładów znajdziesz w pliku spec/algorithm_playground_spec.rb
```

💡 **Hint:** mżesz przetestować poprawność swojego rozwiązania za pomocą przygotowanych przez nas testów. 
W przypadku kiedy nie spotkałaś/spotkałeś się wcześniej z Rspec poniżej
znajdziesz krótki tutorial co i jak odpalać :)

##### Część druga - SQL

```
ZADANIE 1:

Napisz zapytanie zliczające imiona klientów, które powtarzają się minimum dwa razy.
Zapytanie powinno dodatkowo wyświetlić tę liczbę w kolumnie names_count.

- tabela users:
+----+---------------+--------------------------------+------------+--------+-------------+
| id | date_of_birth | email                          | first_name | gender | last_name   |
+----+---------------+--------------------------------+------------+--------+-------------+
| 4  | 1969-01-27    | andrzej_bocian@gmail.com       | Andrzej    | f      | Szpak       |
| 7  | 1974-12-24    | gabi.zaPolsKa@GmaiL.cOM        | Gabriela   | t      | Zapolska    |
| 10 | 1974-06-20    | andrzej_wokulskiA@gmAiL.com    | Andrzej    | f      | Wokulski    |
| 15 | 1983-10-16    | zenon.ziembiewicz@gmail.com    | Zenon      | f      | Ziembiewicz |
| 19 | 1956-09-12    | wrobel.andrzej@interia.pl      | Andrzej    | f      | Wróbel      |
| 24 | 1956-11-01    | Wr.AGATA.bEl@gMAIl.cOM         | Agata      | t      | Wróbel      |
| 32 | 1989-01-18    | janusz.luka@gmail.com          | Łukasz     | f      | Janusz      |
| 33 | 1967-04-03    | mrs.nowak@op.pl                | Agata      | t      | Nowak       |
| 81 | 1950-11-30    | a.janusz@o2.pl                 | Andrzej    | f      | Janusz      |
| 89 | 1972-07-10    | mr.nowak3@gmail.com            | Łukasz     | f      | Nowak       |
+--------------------+--------------------------------+------------+--------+-------------+

Spodziewany wynik (uszeregowany po kolumnie names_count):
+----------------+-------------+
| first_name     | names_count |
+----------------+-------------+
| Andrzej        | 4           |
| Agata          | 2           |
| Łukasz         | 2           |
+----------------+-------------+
```

```
ZADANIE 2:

Każdy artykuł (item) w sklepie internetowym należy do sprzedawcy (seller).
Aby zapewnić wysoką jakość, każdy sprzedawca ma swój rating (od 0 do 5). 
Dane te trzymane są w dwóch tabelach:

- tabela sellers:
+-----+------------+----------+
| id  | name       | rating   |
+-----+------------+----------+
| 34  | John       | 4        |
| 39  | Chloe      | 2        |
| 52  | Marie      | 5        |
| 122 | Suzy       | 1        |
| 167 | Stephen    | 5        |
+------------------+----------+

- tabela items:
+-----+-------------------------+-------------+
| id  | name                    | seller_id   |
+-----+-------------------------+-------------+
| 261 | Incredible Silk Chair   | 52          |
| 262 | Mediocre Marble Watch   | 34          |
| 263 | Durable Iron Knife      | 167         |
| 264 | Rustic Copper Pants     | 39          |
| 265 | Small Rubber Table      | 34          |
+-----+-------------------------+-------------+

Napisz zapytanie, które wyświetla nazwy artykułów i imię jego sprzedawcy
dla każdego artykułu należącego do sprzedawcy z ratingiem wyższym niż 3.

Spodziewany wynik (uszeregowany po nazwie artykłuu):
+-------------------------+-------------+
| item                    | seller      |
+-------------------------+-------------+
| Durable Iron Knife      | Stephen     |
| Incredible Silk Chair   | Marie       |
| Mediocre Marble Watch   | John        |
| Small Rubber Table      | John        |
+-------------------------+-------------+
```

Na koniec szybciusieńki tutorial jak uruchomić testy, które pozwolą Ci sprawdzić
poprawność algorytmu z pierwszej części: 
- [ ] pobierz repozytorium na swoją maszynę (`git clone ...`),
- [ ] będąc w folderze aplikacji zainstaluj zależności (`bundle install`),
- [ ] swój algorytm umieść w module AlgorithmPlayground,
- [ ] testy uruchomisz za pomocą komendy `rspec`.

Jeżeli po raz pierwszy spotykasz się z Rspecem, 
[tutaj](https://relishapp.com/rspec) znajdziesz dokumentację - może być pomocna.

W razie pytań lub problemów - daj nam znać! Postaramy się pomóc 🙂

Powodzenia i do zobaczenia! 🤞
