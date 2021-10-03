Projekt realizowany na zaliczenie Studiów Podyplomowych „Programowanie Aplikacji Webowych” na Akademii Górniczo Hutniczej w Krakowie 

Temat: Aplikacja dla wspólnoty mieszkaniowej

Wykorzystane techonologie: 
	Backend: 
	Ruby on Rails v 6.1.4

	Frontend:
	HTML5 
	CSS3 
	Bootstrap5 
	JavaScript  

	Baza danych: 
	SQLite

Opis konfiguracji środowiska i uruchomienia projektu:

1. Pobieranie i instalacja Ruby 2.7.3:

    W zależności od posiadanego systemu operacyjnego należy pobrać i zainstalować Ruby w wersji 2.7.3 zgodnie z instrukcją:
        ->  https://www.ruby-lang.org/en/downloads/
   
    Jeżeli posiadamy inną wersję języka Ruby należy ją zmienić przy użyciu rbenv:
        -> https://github.com/rbenv/rbenv

2. Instalacja Ruby on Rails
    Po zainstalowaniu Ruby następnie w konsoli wpisujemy komendę:
        -> gem install rails

3. Wypakuj plik "wspolnota_mieszkaniowa.zip".
   
4. W edytorze kodu np. Visual Studio Code otwieramy folder wspolnota_mieszkaniowa.

5. Po załadowaniu projektu w edytorze uruchamiamy terminal i wpisujemy komendnę, która zaktualizuje potrzebne komponenty apliakcji:
        -> bundle install
   
6. Uruchamiamy wirtualny serwer komendą:
        -> rails s
   
7. W przeglądarce internetowej wpisujemy adres:
    -> http://localhost:3000
   
8. Logowanie:
    Dane logowania dla administratora:
	email: admin@ruby.pl
	hasło: 000000

    Dane do logowania dla zarejestrowanych aktualnie użytkowników:
	email: ela.d@ruby.pl
	hasło: 111111

	email: tomek.k@ruby.pl
	hasło: 222222

	email: magda.r@ruby.pl
	hasło: 333333

	email: alek.b@ruby.pl
	hasło: 444444