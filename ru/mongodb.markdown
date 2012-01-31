\thispagestyle{empty}
\changepage{}{}{}{-1.5cm}{}{2cm}{}{}{}
![The Little MongoDB Book, By Karl Seguin](title.png)\ 

\clearpage
\changepage{}{}{}{1.5cm}{}{-2cm}{}{}{}

## О книге ##

### Лицензия ###
The Little MongoDB Book (Маленькая книга о MongoDB) распространяется под лицензией Attribution-NonCommercial 3.0 Unported. **Вы не должны платить за эту книгу.**

Разрешается свободно копировать, распространять, изменять или публиковать данную книгу. Однако, прошу всегда ссылаться на автора - Karl Seguin - и не использовать книгу в коммерческих целях.

Полный текст лицензии всегда можно прочитать здесь:

<http://creativecommons.org/licenses/by-nc/3.0/legalcode>

### Об авторе ###
Karl Seguin - разработчик с опытом во многих областях и технологиях. Он является .NET- и Ruby-разработчиком с большим опытом работы.  Также участвует в open-source проектах, является техническим писателем и нерегулярным докладчик на конференциях. Применительно к MongoDB, он был разработчиком ядра C# MongoDB библиотеки NoRM, написал интерактивный учебник [mongly](http://mongly.com) и [Mongo Web Admin](https://github.com/karlseguin/Mongo-Web-Admin). Его бесплатный сервис для разработчиков казуальных игр, [mogade.com](http://mogade.com/), работает на MongoDB.

Карл также написал книгу [The Little Redis Book](http://openmymind.net/2012/1/23/The-Little-Redis-Book/)

Вот его блог: <http://openmymind.net>, и твиттер: [@karlseguin](http://twitter.com/karlseguin)

### Благодарности ###
Особая благодарность [Perry Neal](http://twitter.com/perryneal) за ум, внимание и энтузиазм. Ты оказал мне неоценимую помощь. Спасибо.

### Последняя версия ###
Свежие исходники книги доступны по адресу: 

<http://github.com/karlseguin/the-little-mongodb-book>.

\clearpage

## Введение ##
 > Не моя вина, что книга такая короткая, просто MongoDB легка в освоении.

Технологии развиваются семимильными шагами. Список новых технологий и методологий постояно растёт. Однако, я всегда придерживался мнения, что фундаментальные технологии, используемые программистами, развиваются не столь стремительно. Можно долгое время обладать актуальными знаниями, не пополняя их. Однако зачастую устоявшиеся технологии заменяются другими с потрясающей скоростью. Внезапные скачки разработок иногда ставят под угрозу устоявшиеся старые технологии.

Яркий пример того - прогресс NoSQL-технологий, приходящих на замену давно известным реляционным базам данных. Вчера еще веб базировался на нескольких известных СУРБД, однако уже сегодня появилось около пяти  NoSQL-решений, достойно зарекомендовших себя.

Несмотря на скачкообразность таких изменений, на деле могут понадобиться годы, чтобы они вошли в общепринятую практику. Начальный энтузиазм, как правило, охватывает небольшое число разработчиков и компаний. Решения оттачиваются, извлекаются уроки, - и, видя, что новая технология развивается, остальные пробуют применять её для своих нужд. Опять же, это касается сферы NoSQL, где множество технологий являются не столько прямой заменой более традиционным механизмам хранения, сколько являются решениями специальных проблем, в дополнение к тому, что можно ожидать от традиционных систем.

Принимая во внимание всё вышеизложенное, мы должны уяснить, чем же является NoSQL. Это широкий термин, в который означает разное для разных людей. Лично я использую его в широком смысле, чтобы обозначить систему, участвующую в хранении данных. С другой стороны NoSQL для меня означает убежденность в том, что задача хранения данных не возлагается на одну большую систему. В то время, как производители большинства баз данных исторически пытались позиционировать свой софт, как решение "всё в одном", NoSQL стремится к меньшему уровню ответственности - когда для определенных задач  может быть выбран такой инструмент, который бы решал именно эту задачу наилучшим образом. К примеру, ваш NoSQL-стек может эффективно использовать реляционные базы данных, как например MySQL, однако он также может включать в себя Redis - для организации хранения записей key-value или Hadoop - для интенсивной обработки данных. Проще говоря, NoSQL - это открытая технология, состоящая из альтернативных, существующих и дополнительных паттернов управления данными.

Удивительно, но MongoDB подходит под все эти определения. Как документ-оринентированная СУБД, Mongo - это довольно-таки обобщенное NoSQL решение. Ее можно рассматривать, как альтернативу реляционным СУБД. Подобно реляционным СУБД, она также может выигрышно дополняться более специализированными NoSQL решниями. У MongoDB есть как достоинства, так и не достатки, о них мы поговорим в следующих частях книги. 

Как вы уже заметили, термины MongoDB и Mongo используются как синонимы.

## Приступая к работе ##
Большая часть книги освещает базовые возможности MongoDB. Поэтому нам понадобится консоль MongoDB. Консоль будет использоваться для учебных и административных задач, а в коде мы будем пользоваться драйвером MongoDB.

Мы подошли к первому, что надо знать о MongoDB: к её драйверам. У MongoDB есть [множество официальных драйверов](http://www.mongodb.org/display/DOCS/Drivers) для различных языков. Их можно рассматривать как драйверы уже привычных реляционных БД. На их основе сообщество разработчиков построило множество высокоуровневых драйверов - для определенных языков и фреймворков. Например, [NoRM](https://github.com/atheken/NoRM) это библиотека для C#, реализующая LINQ, а [MongoMapper](https://github.com/jnunemaker/mongomapper) для Ruby, с поддержкой ActiveRecord. Программировать напрямую, используя низкоуровневые драйверы MongoDB, или же с применением высокоуровневых библиотек - решайте сами. Я подробно остановился на этом, потому что множество новичков бывают сбиты с толку наличием как официальных драйверов, так и разрабатываемых сообществом - первые нацелены на  базовую коммуникацию с Mongo, в то время как вторые - больше на внедрение в конкретные языки и фреймворки.

По мере чтения старайтесь воспроизводить демонстрируемые примеры, а также изучать вопросы, которые могут при этом возникнуть. Поднять у себя MongoDB просто, нам понадобится несколько минут, чтобы все настроить. 

1. Зайдите на [официальную страницу скачивания](http://www.mongodb.org/downloads) и скачайте бинарные файлы из первой строки (рекомендованную стабильную версию) для операционной системы, которую вы используете. Для разработки можно использовать как 32-, так и 64-разрядную версию.

2. Распакуйте архив (куда угодно) и перейдите в папку `bin`. Пока ничего не запускайте, но запомните, что `mongod` - это сервер, а  `mongo` - клиентская консоль - вот два исполняемых файла, с которыми нам чаще всего предстоит работать. 

3. Создайте новый файл в папке `bin` и назовите его `mongodb.config`

4. Добавьте в mongodb.config одну строку: `dbpath=ПУТЬ_КУДА_ХОТИТЕ_СОХРАНИТЬ_ФАЙЛЫ_БАЗЫ_ДАННЫХ`. Например, в Windows можно написать `dbpath=c:\mongodb\data` а в Linux - `dbpath=/etc/mongodb/data`. 

5. Убедитесь, что указанный вами путь `dbpath` существует.

6. Запустите mongod с параметром `--config /path/to/your/mongodb.config`.

Для пользователей Windows, например, если вы распаковали скачанный файл в `c:\mongodb\` и создали папку `c:\mongodb\data\`, то в `c:\mongodb\bin\mongodb.config` следует указать `dbpath=c:\mongodb\data\`. Теперь можно запускать `mongod` из командной строки с помощью команды `c:\mongodb\bin\mongod --config c:\mongodb\bin\mongodb.config`.

Папку `bin` можно для удобства добавить в переменную окружения `PATH`. Для пользователей MacOSX и Linux инструкции практически те же самые. Всё, что нужно сделать - это просто изменить пути.

Надеюсь, теперь MonogDB у вас установлена и запущена. Если есть ошибки - внимательно читайте сообщения в консоли - сервер подробно и ясно выводит диагностические сообщения.

Теперь, чтобы подключиться к запущенному серверу, можете запустить `mongo` (без *d* в конце). Попробуйте ввести `db.version()`, чтобы убедиться, что все в порядке. Если всё нормально - вы увидите номер версии вашего сервера.

\clearpage

## Глава 1 - Основы ##
Начнем мы с изучения основных механизмов работы с MongoDB. Это самое основное, что понадобится для понимания MongoDB, но также мы коснемся высокоуровневых вопросов - о том, где применима MongoDB.

Для начала нужно понять шесть основных концепций.

1. MongoDB - концептуально то же самое, что обычная, привычная нам база данных (или в терминологии Oracle - схема).  Внутри MongoDB может быть ноль или более баз данных, каждая из которых является контейнером для прочих сущностей.

2. База данных может иметь ноль или более 'коллекций'. Коллекция настолько похожа на традиционную "таблицу", что можно смело считать их одним и тем же.

3. Коллекции состоят из нуля или более "документов". Опять же, документ можно рассматривать как "строку".

4. Документ состоит из одного или более "полей", которые - как можно догадаться - подобны "колонкам".

5. "Индексы" в MongoDB почти идентичны таковым в реляционных базах данных.

6. "Курсоры" отличаются от предыдущих пяти концепций, но они очень важны (хотя порой их обходят вниманием) и заслуживают отдельного обсуждения.  Важно понимать, что когда мы запрашиваем у MongoDB какие-либо данные, то она возвращает курсор, с которыми мы можем делать все что угодно - подсчитывать, пропускать определенное число предшествующих записей - при этом не загружая сами данные.

Подводя итог, MongoDB состоит из "баз данных", которые состоят из "коллекций". "Коллекции" состоят из "документов". Каждый "документ" состоит из "полей". "Коллекции" могут быть проиндексированы, что улучшает производительность выборки и сортировки. И наконец, получение данных из MongoDB сводится к получению "курсора", который отдает эти данные по мере надобности.

Вы можете спросить - зачем придумывать новые термины (коллекция вместо таблицы, документ вместо записи и поле вместо колонки)? Не излишнее ли это усложнение? Ответ в том, что эти термины, хоть и близки своим "реляционным" аналогам, но не полностью идентичны им. Основное различие в том, что  реляционный базы данных определяют "колонки" на уровне "таблицы", в то время, как документ-ориентированные базы данных определяют "поля" на уровне "документа" Это значит, что любой документ внутри коллекции может иметь свой собственный уникальный набор полей.  В этом смысле `коллекция` "глупее" чем `таблица`, тогда как `документ` имеет намного больше информации, чем `строка`.

Хоть это и важно понять, не волнуйтесь, если не сможете сразу. После нескольких вставок вы увидите, что имеется в виду. В конечном счете дело в том, что коллекция не содержит информации о структуре содержащихся в ней данных. Информацию о полях содержит каждый отдельный документ. Преимущества и недостатки этого станут понятны из следующей главы.

Приступим. Запустите сервер `mongod` и консоль `mongo`, если еще не запустили. Консоль работает на JavaScript. Есть несколько глобальных команд, например `help` или `exit`. Команды, которые вы запускаете применительно к текущей базе данных исполняются у объекта `db`, например `db.help()` или `db.stats()` . Команды, которые вы запускаете применительно к конкретной коллекции, исполняются у объекта `db.ИМЯ_КОЛЛЕКЦИИ`, например `db.unicorns.help()` или `db.unicorns.count()` .

Введите `db.help()` и получите список команд, которые можно выполнить у объекта `db`.

Заметка на полях. Поскольку консоль интерпретирует JavaScript, если вы попытаетесь выполнить метод без скобок, то в ответ получите тело метода, но он не выполнится. Не удивляйтесь, увидев `function (...){`, если случайно сделаете так. Например, если введёте `db.help` (без скобок), вы увидите внутренне представление метода `help`.

Сперва для выбора базы данных воспользуемся глобальным методом `use` - введите `use learn`. Неважно, что база данных пока еще не существует. В момент создания первой коллекции создастся база данных `learn`. Теперь, когда вы внутри базы данных, можно вызывать у неё команды, например `db.getCollectionNames()`. В ответ увидите пустой массив (`[ ]`). Поскольку коллекции безструктурны *(в оригинале "schema-less". Здесь и далее - прим. перев.)*, мы не обязаны создавать их явно. Мы просто можем вставить документ в новую коллекцию. чтобы это сделать, используйте команду `insert`, передав ей вставляемый документ:

	db.unicorns.insert({name: 'Aurora', gender: 'f', weight: 450})

Данная строка выполняет метод `insert` ("вставить") в коллекцию `unicorns`, передавая ему единственный аргумент. MongoDB у себя внутри использует бинарный сериализированный JSON формат. Снаружи это означает, что мы широко используем JSON, как, например, в случае с нашими параметрами. Если теперь выполнить `db.getCollectionNames()`, мы увидим две коллекции: `unicorns` и `system.indexes`. `system.indexes` создается в каждой базе данных и содержит в себе информацию об индексах этой базы. 

Теперь у коллекции `unicorns` можно вызвать метод `find`, который вернет ссписок документов:

	db.unicorns.find()

Заметьте, что кроме данных, которые мы задавали, появилось дополнительное поле `_id` . Каждый документ должен иметь уникальное поле `_id`. Можете генерировать его сами или позволить MongoDB самой сгенерировать для вас ObjectId. В большинстве случаев вы скорее всего возложите эту задачу на MongoDB. По умолчанию `_id` - индексируемое поле, вследствие чего и создается коллекция `system.indexes`. Давайте взглянем на `system.indexes`:

	db.system.indexes.find()

Вы увидите имя индекса, базы данных и коллекции, для которой индекс был создан, а также полей, которые включены в него.

Вернемся к обсуждению безструктурных коллекций. Давайте вставим кардинально отличный от предыдущего документ в `unicorns`, вот такой:

	db.unicorns.insert({name: 'Leto', gender: 'm', home: 'Arrakeen', worm: false})

И снова воспользуемся `find` для просмотра списка документов. Теперь, узнав чуть больше, мы можем обсудить это интересное поведение MongoDB, но, надеюсь, вы уже начинаете понимать, почему традиционная терминология здесь не совсем применима.

### Осваиваем селекторы ###
В дополнение к изученным ранее шести концепциям, есть еще один немаловажный практический аспект MongoDB, который следует освоить, прежде чем переходить к более сложным темам: это - селекторы запросов. Селектор запросов MongoDB аналогичен предложению `where` SQL-запроса. Как таковой он используется для поиска, подсчёта, обновления и удаления документов из коллекций. Селектор - это JSON-объект, в простейшем случае это может быть даже `{}`, что означает выборку всех документов (аналогичным образом работает `null`). Если нам нужно выбрать всех единорогов (англ. "unicorns") женского рода, можно воспользоваться селектором `{gender:'f'}`.

Прежде, чем мы глубоко погрузимся в селекторы, давайте сначала создадим немного данных, с которыми будем экспериментировать. Сперва давайте удалим всё, что до этого вставляли в коллекцию `unicorns` с помощью команды: `db.unicorns.remove()` (поскольку мы не передали селектора, произйдет удаление всех документов). Теперь давайте произведем следующие вставки, чтобы получить данные для дальнейших экспериментов (можете скопировать и вставить это в консоль):

	db.unicorns.insert({name: 'Horny', dob: new Date(1992,2,13,7,47), loves: ['carrot','papaya'], weight: 600, gender: 'm', vampires: 63});
	db.unicorns.insert({name: 'Aurora', dob: new Date(1991, 0, 24, 13, 0), loves: ['carrot', 'grape'], weight: 450, gender: 'f', vampires: 43});
	db.unicorns.insert({name: 'Unicrom', dob: new Date(1973, 1, 9, 22, 10), loves: ['energon', 'redbull'], weight: 984, gender: 'm', vampires: 182});
	db.unicorns.insert({name: 'Roooooodles', dob: new Date(1979, 7, 18, 18, 44), loves: ['apple'], weight: 575, gender: 'm', vampires: 99});
	db.unicorns.insert({name: 'Solnara', dob: new Date(1985, 6, 4, 2, 1), loves:['apple', 'carrot', 'chocolate'], weight:550, gender:'f', vampires:80});
	db.unicorns.insert({name:'Ayna', dob: new Date(1998, 2, 7, 8, 30), loves: ['strawberry', 'lemon'], weight: 733, gender: 'f', vampires: 40});
	db.unicorns.insert({name:'Kenny', dob: new Date(1997, 6, 1, 10, 42), loves: ['grape', 'lemon'], weight: 690,  gender: 'm', vampires: 39});
	db.unicorns.insert({name: 'Raleigh', dob: new Date(2005, 4, 3, 0, 57), loves: ['apple', 'sugar'], weight: 421, gender: 'm', vampires: 2});
	db.unicorns.insert({name: 'Leia', dob: new Date(2001, 9, 8, 14, 53), loves: ['apple', 'watermelon'], weight: 601, gender: 'f', vampires: 33});
	db.unicorns.insert({name: 'Pilot', dob: new Date(1997, 2, 1, 5, 3), loves: ['apple', 'watermelon'], weight: 650, gender: 'm', vampires: 54});
	db.unicorns.insert({name: 'Nimue', dob: new Date(1999, 11, 20, 16, 15), loves: ['grape', 'carrot'], weight: 540, gender: 'f'});
	db.unicorns.insert({name: 'Dunx', dob: new Date(1976, 6, 18, 18, 18), loves: ['grape', 'watermelon'], weight: 704, gender: 'm', vampires: 165});

Теперь, когда данные созданы, можно приступать к освоению селекторов. `{поле: значение}` используется для поиска всех документов, у которых `поле` равно `значение`. `{поле1: значение1, поле2: значение2}` работает как логическое `И`. Специальные операторы `$lt`, `$lte`, `$gt`, `$gte` и `$ne` используются для выражения операций "меньше", "меньше или равно", "больше", "больше или равно", и "не равно". Например, чтобы получить всех самцов единорога, весящих более 700 фунтов, мы можем написать:

	db.unicorns.find({gender: 'm', weight: {$gt: 700}})
	//или (что не полностью эквивалентно, но приведено здесь в демонстрационных целях)
	db.unicorns.find({gender: {$ne: 'f'}, weight: {$gte: 701}})

Оператор `$exists` используется для проверки наличия или отсутствия поля, например:

	db.unicorns.find({vampires: {$exists: false}})

Вернет единственный документ. Если нужно ИЛИ вместо И, мы можем использовать оператор `$or` и присвоить ему массив значений, например:

	db.unicorns.find({gender: 'f', $or: [{loves: 'apple'}, {loves: 'orange'}, {weight: {$lt: 500}}]})

Вышеуказанный запрос вернет всех самок единорогов, которые или любят яблоки, или любят апельсины, или весят менее 500 фунтов.

В нашем последнем примере произошло кое-что интересное. Вы заметили - поле `loves` это массив. MongoDB поддерживает массивы как объекты первого класса. Это потрясающе удобная возможность. Начав это использовать, вы удивитесь, как вы раньше жили без этого. Самое интересное это та простота, с которой делается выборка по значению массива: `{loves: 'watermelon'}` вернет нам все документы, у которых `watermelon` является одним из значений поля `loves`.

Это еще не все операторы. Самый гибкий оператор - `$where`, позволяющий нам передавать JavaScript для его выполнения на сервере. Это описано в разделе [Сложные запросы](http://ru.wiki.mongodb.org/display/DOCS/Advanced+Queries) на сайте MongoDB. Мы изучили основы, которые нам нужны для начала работы. Это также то, что вы будете использовать большую часть времени.

Мы видели, как эти селекторы могут быть использованы с командой `find`. Они также могут быть использованы с командой `remove`, которую мы кратко рассмотрели, командой `count`, на которую мы пока не взглянули, но которую вы скорее всего изучите, и командой `update`, с которой в дальнейшем мы проведем большую часть времени.

`ObjectId`, сгенерированный MongoDB для поля `_id`, подставляется в селектор следующим образом:

	db.unicorns.find({_id: ObjectId("TheObjectId")})

### В этой главе ###
Мы пока еще не рассматривали команду `update` или более интересные вещи, которые можно сделать с помощью `find`. Однако мы подняли MongoDB, кратко изучили команды `insert` и  `remove` (изучив практически всё, что о них можно изучить) . Мы также начали исследовать `find` и узнали что такое селекторы MongoDB. Это неплохо для начала, и основы для дальнейшего изучения заложены. Верите или нет, но вы уже изучили практически всё, что нужно знать о MongoDB - настолько она проста и легка в изучении. Я настоятельно рекомендую вам поэкспериментировать с вашими данными, прежде, чем можно будет двигаться дальше. Вставьте несколько новых документов - возможно в новые коллекци - и поэкспериментируйте с селекторами. Используйте `find`, `count` и `remove`. После нескольких ваших собственных попыток вещи, казавшиеся непонятными, станут на свои места.

\clearpage

## Глава 2 - Обновление ##
В первой главе мы изучили три из четырёх операций CRUD (create, read, update and delete). Эта глава посвящена четвёртой: `update`. У `update` имеются некоторые особенности, вот почему мы посвящаем этому целую главу.

### Обновление данных: замена и $set ###
В простейшей форме, `update` принимает 2 аргумента: селектор (where) для выборки и то, чем обновить соответствующее поле. Чтобы Roooooodles прибавил в весе, используем следующий запрос:

	db.unicorns.update({name: 'Roooooodles'}, {weight: 590})

(Если в ходе экспериментов вы удалили данные из ранее созданной коллекции `unicorns`, сделайте всем документам `remove`, и вставьте их заново с помощью кода из главы 1)

В реальной жизни, конечно, следует обновлять документы, выбирая их по `_id`, однако, поскольку я не знаю какой `_id` MongoDB сгенерировала для вас, будем выбирать по имени - `name`.  Теперь, давайте взглянем на обновленную запись:

	db.unicorns.find({name: 'Roooooodles'})

Вот и первый сюрприз, который нам преподнёс `update`. Документ не найден, поскольку второй параметр используется для **полной замены** оригинала. Иными словами, `update` нашел документ по имени и заменил его целиком на новый документ (свой второй параметр). Вот в чём отличие от SQL-команды `UPDATE`. Иногда это идеальный вариант, который может использоваться для некоторых действительно динамических обновлений. Однако, если вам нужно всего лишь изменить пару полей, лучше всего использовать модификатор `$set`:

	db.unicorns.update({weight: 590}, {$set: {name: 'Roooooodles', dob: new Date(1979, 7, 18, 18, 44), loves: ['apple'], gender: 'm', vampires: 99}})

Это восстановит утерянные ранее поля. Поле `weight` не перезапишется, поскольку мы его не передали в запрос. Теперь, если выполнить:

	db.unicorns.find({name: 'Roooooodles'})

мы получим ожидаемый результат. Таким образом в первом примере правильно было бы обновить `weight` следующим образом:

	db.unicorns.update({name: 'Roooooodles'}, {$set: {weight: 590}})

### Модификаторы обновления ###
Кроме `$set` можно использовать и другие модификаторы для разных изящных вещей. Все эти модификаторы обновления действуют над полями - так что ваш документ не окажется перезаписан целиком. Например, модификатор `$inc` служит для того, чтобы изменить поле на положительную (увеличить) или отрицательную (уменьшить) величину . Например, если единорог Pilot был ошибочно награжден за убийство пары лишних вампиров, мы можем исправить эту ошибку следующим образом:

	db.unicorns.update({name: 'Pilot'}, {$inc: {vampires: -2}})

Если Aurora внезапно пристрастилась к сладостям, мы можем добавить соответствующее значение к ее полю `loves` с помощью модификатора `$push`:

	db.unicorns.update({name: 'Aurora'}, {$push: {loves: 'sugar'}})

Информацию об остальных модификаторах можно найти в разделе [Обновление](http://ru.wiki.mongodb.org/display/DOCS/Updating) на сайте MongoDB.

### Обновление/вставка ###
Один из приятных сюрпризов операции обновления - это возможность обновления/вставки *(`upsert` от `update` - обновить и `insert` - вставить)* Обновление/вставка обновляет документ, если он найден, или создаёт новый - если не найден. Обновление/вставка - полезная вещь в некоторых случаях; когда столкнётесь с подобным, сразу поймёте. Чтобы разрешить вставку при обновлении, установите третий параметр в `true`.

Пример из жизни - счетчик посещений для веб-сайта. Если мы хотим в реальном времени видеть количество посещений страницы, мы должны посмотреть, существует ли запись, и - в зависимости от результата - выполнить `update` либо `insert`. Если опустить (или установить в `false`) третий параметр, следующий пример не сработает:

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}});
	db.hits.find();

Однако, если разрешить вставку при обновлении, результаты будут иными:

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}}, true);
	db.hits.find();

Поскольку документы с полем `page`, равным `unicorns`, не существуют, то будет создан новый документ. Если выполнить это вторично, существующий документ будет обновлён, и поле `hits` увеличится до 2.

	db.hits.update({page: 'unicorns'}, {$inc: {hits: 1}}, true);
	db.hits.find();

### Множественные обновления ###
Последний сюрприз метода `update` - это то что он по умолчанию обновляет лишь один документ. До сих пор это было логично в случае с уже рассмотренными примерами. Однако, если выполнить что-нибудь вроде:

	db.unicorns.update({}, {$set: {vaccinated: true }});
	db.unicorns.find({vaccinated: true});

, то вы очевидно будете ожидать, что все единороги будут привиты *(`vaccinated`)*. Чтобы это сработало, нужно установить четвертый параметр в `true`:
 
	db.unicorns.update({}, {$set: {vaccinated: true }}, false, true);
	db.unicorns.find({vaccinated: true});

### В этой главе ###
Эта глава завершила введение в основные CRUD операции над коллекциями. Мы детельно рассмотрели `update` и увидели три его интересных режима работы. Во-первых, в отличие от SQL-команды `UPDATE`, в MongoDB `update` заменяет документ целиком. Из-за этого модификатор `$set` очень полезен. Во-вторых, `update` поддерживает интуитивно простое обновление/вставку, которое особенно полезно с модификатором `$inc`. И, наконец, в-третьих, по умолчанию, `update` обновляет лишь первый найденный документ.

Помните, что мы рассматриваем MongoDB с точки зрения её консоли. Используемые вами драйверы и библиотеки могут иметь иное поведение и реализовывать иной API. Например, драйвер для Ruby сливает два параметра в один хэш: `{:upsert => false, :multi => false}`.

\clearpage

## Глава 3 - Осваиваем Find ##
В главе 1 мы вкратце рассмотрели команду `find`. Однако, `find` - это не только селекторы. Как уже упоминалось, результатом `find` является курсор. Пришло время рассмотреть это детальнее.

### Выбор полей ###
Прежде чем переходить к курсорам, следует знать, что `find` принимает второй необязательный параметр. Это - список полей, которые мы хотим получить. Например, мы можем получить все имена единорогов следующим запросом:

	db.unicorns.find(null, {name: 1});

Поле `_id` по умолчанию возвращается всегда. Мы можем явным способом исключить его, указав `{name:1, _id: 0}`.

За исключением поля `_id`, нельзя смешивать включения и исключения полей. Задумавшись, можно понять, зачем так сделано. Можно или хотеть включить или хотеть наоборот - исключить определенные поля явным образом.

### Сортировка ###
Я уже несколько раз упомянул, что `find` возвращает курсор, который исполняется отложенно - по мере необходимости. Однако, вы уже без сомнения могли видеть, что `find` исполняется мгновенно. Такое поведение характерно только для консоли. Можно пронаблюдать за истинным поведением курсоров, взглянув на любой из методов, который мы можем присоединить к `find`. Первым из них будет `sort`. Синтаксис `sort` примерно такой же, как у выбора полей, который мы видели в предыдущем разделе. Мы указываем поля, по которм надо сортировать, используя `1` для сортировки по возрастанию и `-1` для сортировки по убыванию. Например:

	//сортируем по весу - от тяжёлых к лёгким единорогам
	db.unicorns.find().sort({weight: -1})
	
	//по имени вампира, затем по числу убитых вампиров:
	db.unicorns.find().sort({name: 1, vampires: -1})

Подобно реляционной базе данных, MongoDB может использовать индексы для сортировки. Детальнее мы рассмотрим индексы несколько позже. Однако следует знать, что без индекса MongoDB ограничивает размер сортируемых данных. Если вы попытаетесь отсортировать большой объем данных, не используя индекс, вы получите ошибку. Некоторые считают это ограничением. Хотя я думаю, что и другим базам данных не мешало бы запрещать выполнение неоптимальных запросов. (Я не стану превращать каждый недостаток MongoDB в её достоинство, однако я сталкивался с большим числом неоптимальных баз данных, которым очень не хватало подобного режима строгой проверки.)

### Разбиение на страницы ###
Разбиение на страницы может быть осуществлено с помощью методов `limit` и `skip`. Чтобы получить второго и третьего по весу единорога, можно выполнить:

	db.unicorns.find().sort({weight: -1}).limit(2).skip(1)

Используя `limit` вместе с `sort` можно избежать проблем с сортировкой по неиндексированным полям.

### Count ###
Консоль позволяет выполнить `count` прямо над коллекцией:

	db.unicorns.count({vampires: {$gt: 50}})

На практике же `count` - это метод курсора, консоль просто обеспечивает удобное сокращение. С драйверами, не поддерживающим подобного сокращения, нужно писать что-то вроде этого (конечно, и в консоли тоже так можно):

	db.unicorns.find({vampires: {$gt: 50}}).count()

### In This Chapter ###
Using `find` and `cursors` is a straightforward proposition. There are a few additional commands that we'll either cover in later chapters or which only serve edge cases, but, by now, you should be getting pretty comfortable working in the mongo shell and understanding the fundamentals of MongoDB.

\clearpage

## Chapter 4 - Data Modeling ##
Let's shift gears and have a more abstract conversation about MongoDB. Explaining a few new terms and some new syntax is a trivial task. Having a conversation about modeling with a new paradigm isn't as easy. The truth is that most of us are still finding out what works and what doesn't when it comes to modeling with these new technologies. It's a conversation we can start having, but ultimately you'll have to practice and learn on real code.

Compared to most NoSQL solutions, document-oriented databases are probably the least different, compared to relational databases, when it comes to modeling. The differences which exist are subtle but that doesn't mean they aren't important. 

### No Joins ###
The first and most fundamental difference that you'll need to get comfortable with is MongoDB's lack of joins. I don't know the specific reason why some type of join syntax isn't supported in MongoDB, but I do know that joins are generally seen as non-scalable. That is, once you start to horizontally split your data, you end up performing your joins on the client (the application server) anyways. Regardless of the reasons, the fact remains that data *is* relational, and MongoDB doesn't support joins.

Without knowing anything else, to live in a join-less world, we have to do joins ourselves within our application's code. Essentially we need to issue a second query to `find` the relevant data. Setting our data up isn't any different than declaring a foreign key in a relational database. Let's give a little less focus to our beautiful `unicorns` and a bit more time to our `employees`. The first thing we'll do is create an employee (I'm providing an explicit `_id` so that we can build coherent examples)

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d730"), name: 'Leto'})

Now let's add a couple employees and set their manager as `Leto`:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d731"), name: 'Duncan', manager: ObjectId("4d85c7039ab0fd70a117d730")});
	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d732"), name: 'Moneo', manager: ObjectId("4d85c7039ab0fd70a117d730")});


(It's worth repeating that the `_id` can be any unique value. Since you'd likely use an `ObjectId` in real life, we'll use them here as well.)

Of course, to find all of Leto's employees, one simply executes:

	db.employees.find({manager: ObjectId("4d85c7039ab0fd70a117d730")})

There's nothing magical here. In the worst cases, most of the time, the lack of join will merely require an extra query (likely indexed).

#### Arrays and Embedded Documents ####
Just because MongoDB doesn't have joins doesn't mean it doesn't have a few tricks up its sleeve. Remember when we quickly saw that MongoDB supports arrays as first class objects of a document? It turns out that this is incredibly handy when dealing with many-to-one or many-to-many relationships. As a simple example, if an employee could have two managers, we could simply store these in an array:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d733"), name: 'Siona', manager: [ObjectId("4d85c7039ab0fd70a117d730"), ObjectId("4d85c7039ab0fd70a117d732")] })

Of particular interest is that, for some documents, `manager` can be a scalar value, while for others it can be an array. Our original `find` query will work for both:

	db.employees.find({manager: ObjectId("4d85c7039ab0fd70a117d730")})

You'll quickly find that arrays of values are much more convenient to deal with than many-to-many join-tables.

Besides arrays, MongoDB also supports embedded documents. Go ahead and try inserting a document with a nested document, such as:

	db.employees.insert({_id: ObjectId("4d85c7039ab0fd70a117d734"), name: 'Ghanima', family: {mother: 'Chani', father: 'Paul', brother: ObjectId("4d85c7039ab0fd70a117d730")}})

In case you are wondering, embedded documents can be queried using a dot-notation:

	db.employees.find({'family.mother': 'Chani'})

We'll briefly talk about where embedded documents fit and how you should use them.

#### DBRef ####
MongoDB supports something known as `DBRef` which is a convention many drivers support. When a driver encounters a `DBRef` it can automatically pull the referenced document. A `DBRef` includes the collection and id of the referenced document. It generally serves a pretty specific purpose: when documents from the same collection might reference documents from a different collection from each other. That is, the `DBRef` for document1 might point to a document in `managers` whereas the `DBRef` for document2 might point to a document in `employees`.


#### Denormalization ####
Yet another alternative to using joins is to denormalize your data. Historically, denormalization was reserved for performance-sensitive code, or when data should be snapshotted (like in an audit log). However, with the ever-growing popularity of NoSQL, many of which don't have joins, denormalization as part of normal modeling is becoming increasingly common. This doesn't mean you should duplicate every piece of information in every document. However, rather than letting fear of duplicate data drive your design decisions, consider modeling your data based on what information belongs to what document.

For example, say you are writing a forum application. The traditional way to associate a specific `user` with a `post` is via a `userid` column within `posts`. With such a model, you can't display `posts` without retrieving (joining to) `users`. A possible alternative is simply to store the `name` as well as the `userid` with each `post`. You could even do so with an embedded document, like `user: {id: ObjectId('Something'), name: 'Leto'}`. Yes, if you let users change their name, you'll have to update each document (which is 1 extra query). 

Adjusting to this kind of approach won't come easy to some. In a lot of cases it won't even make sense to do this. Don't be afraid to experiment with this approach though. It's not only suitable in some circumstances, but it can also be the right way to do it.

#### Which Should You Choose? ####
Arrays of ids are always a useful strategy when dealing with one-to-many or many-to-many scenarios. It's probably safe to say that `DBRef` aren't use very often, though you can certainly experiment and play with them. That generally leaves new developers unsure about using embedded documents versus doing manual referencing.

First, you should know that an individual document is currently limited to 4 megabytes in size. Knowing that documents have a size limit, though quite generous, gives you some idea of how they are intended to be used. At this point, it seems like most developers lean heavily on manual references for most of their relationships. Embedded documents are frequently leveraged, but mostly for small pieces of data which we want to always pull with the parent document. A real world example I've used is to store an `accounts` document with each user, something like:

	db.users.insert({name: 'leto', email: 'leto@dune.gov', account: {allowed_gholas: 5, spice_ration: 10}})

That doesn't mean you should underestimate the power of embedded documents or write them off as something of minor utility. Having your data model map directly to your objects makes things a lot simpler and often does remove the need to join. This is especially true when you consider that MongoDB lets you query and index fields of an embedded document. 

### Few or Many Collections ###
Given that collections don't enforce any schema, it's entirely possible to build a system using a single collection with a mismatch of documents.  From what I've seen, most MongoDB systems are laid out similarly to what you'd find in a relational system. In other words, if it would be a table in a relational database, it'll likely be a collection in MongoDB (many-to-many join tables being an important exception).

The conversation gets even more interesting when you consider embedded documents. The example that frequently comes up is a blog. Should you have a `posts` collection and a `comments` collection, or should each `post` have an array of `comments` embedded within it. Setting aside the 4MB limit for the time being (all of Hamlet is less than 200KB, just how popular is your blog?), most developers still prefer to separate things out. It's simply cleaner and more explicit.

There's no hard rule (well, aside from 4MB). Play with different approaches and you'll get a sense of what does and does not feel right. 

### In This Chapter ###
Our goal in this chapter was to provide some helpful guidelines for modeling your data in MongoDB. A starting point if you will. Modeling in a document-oriented system is different, but not too different than a relational world. You have a bit more flexibility and one constraint, but for a new system, things tend to fit quite nicely. The only way you can go wrong is by not trying.

\clearpage

## Chapter 5 - When To Use MongoDB ##
By now you should have a good enough understanding of MongoDB to have a feel for where and how it might fit into your existing system. There are enough new and competing storage technologies that it's easy to get overwhelmed by all of the choices. 

For me, the most important lesson, which has nothing to do with MongoDB, is that you no longer have to rely on a single solution for dealing with your data. No doubt, a single solution has obvious advantages and for a lot projects, possibly even most, a single solution is the sensible approach. The idea isn't that you must use different technologies, but rather that you can. Only you know whether the benefits of introducing a new solution outweigh the costs.

With that said, I'm hopeful that what you've seen so far has made you see MongoDB as a general solution. It's been mentioned a couple times that document-oriented databases share a lot in common with relational databases. Therefore, rather than tiptoeing around it, let's simply state that MongoDB should be seen as a direct alternative to relational databases. Where one might see Lucene as enhancing a relational database with full text indexing, or Redis as a persistent key-value store, MongoDB is a central repository for your data.

Notice that I didn't call MongoDB a *replacement* for relational databases, but rather an *alternative*. It's a tool that can do what a lot of other tools can do. Some of it MongoDB does better, some of it MongoDB does worse. Let's dissect things a little further.

### Schema-less ###
An oft-touted benefit of document-oriented database is that they are schema-less. This makes them much more flexible than traditional database tables. I agree that schema-less is a nice feature, but not for the main reason most people mention.

People talk about schema-less as though you'll suddenly start storing a crazy mismatch of data. There are domains and data sets which can really be a pain to model using relational databases, but I see those as edge cases. Schema-less is cool, but most of your data is going to be highly structured. It's true that having an occasional mismatch can be handy, especially when you introduce new features, but in reality it's nothing a nullable column probably wouldn't solve just as well.

For me, the real benefit of schema-less design is the lack of setup and the reduced friction with OOP. This is particularly true when you're working with a static language. I've worked with MongoDB in both C# and Ruby, and the difference is striking. Ruby's dynamism and its popular ActiveRecord implementations already reduce much of the object-relational impedance mismatch. That isn't to say MongoDB isn't a good match for Ruby, it really is. Rather, I think most Ruby developers would see MongoDB as an incremental improvement, whereas C# or Java developers would see a fundamental shift in how they interact with their data. 

Think about it from the perspective of a driver developer. You want to save an object? Serialize it to JSON (technically BSON, but close enough) and send it to MongoDB. There is no property mapping or type mapping. This straightforwardness definitely flows to you, the end developer.

### Writes ###
One area where MongoDB can fit a specialized role is in logging. There are two aspects of MongoDB which make writes quite fast. First, you can send a write command and have it return immediately without waiting for it to actually write. Secondly, with the introduction of journaling in 1.8, and enhancements made in 2.0, you can control the write behavior with respect to data durability. These settings, in addition to specifying how many servers should get your data before being considered successful, are configurable per-write, giving you a great level of control over write performance and data durability.

In addition to these performance factors, log data is one of those data sets which can often take advantage of schema-less collections. Finally, MongoDB has something called a [capped collection](http://www.mongodb.org/display/DOCS/Capped+Collections). So far, all of the implicitly created collections we've created are just normal collections. We can create a capped collection by using the `db.createCollection` command and flagging it as capped:

	//limit our capped collection to 1 megabyte
	db.createCollection('logs', {capped: true, size: 1048576})

When our capped collection reaches its 1MB limit, old documents are automatically purged. A limit on the number of documents, rather than the size, can be set using `max`. Capped collections have some interesting properties. For example, you can update a document but it can't grow in size. Also, the insertion order is preserved, so you don't need to add an extra index to get proper time-based sorting.

This is a good place to point out that if you want to know whether your write encountered any errors (as opposed to the default fire-and-forget), you simply issue a follow-up command: `db.getLastError()`. Most drivers encapsulate this as a *safe write*, say by specifying `{:safe => true}` as a second parameter to `insert`.

### Durability ###
Prior to version 1.8, MongoDB didn't have single-server durability. That is, a server crash would likely result in lost data. The solution had always been to run MongoDB in a multi-server setup (MongoDB supports replication). One of the major features added to 1.8 was journaling. To enable it add a new line with `journal=true` to the `mongodb.config` file we created when we first setup MongoDB (and restart your server if you want it enabled right away). You probably want journaling enabled (it'll be a default in a future release). Although, in some circumstances the extra throughput you get from disabling journaling might be a risk you are willing to take. (It's worth pointing out that some types of applications can easily afford to lose data).

Durability is only mentioned here because a lot has been made around MongoDB's lack of single-server durability. This'll likely show up in Google searches for some time to come. Information you find about this missing feature is simply out of date.

### Full Text Search ###
True full text search capability is something that'll hopefully come to MongoDB in a future release. With its support for arrays, basic full text search is pretty easy to implement. For something more powerful, you'll need to rely on a solution such as Lucene/Solr. Of course, this is also true of many relational databases.

### Transactions ###
MongoDB doesn't have transactions. It has two alternatives, one which is great but with limited use, and the other that is a cumbersome but flexible. 

The first is its many atomic operations. These are great, so long as they actually address your problem. We already saw some of the simpler ones, like `$inc` and `$set`. There are also commands like `findAndModify` which can update or delete a document and return it atomically.

The second, when atomic operations aren't enough, is to fall back to a two-phase commit. A two-phase commit is to transactions what manual dereferencing is to joins. It's a storage-agnostic solution that you do in code.  Two-phase commits are actually quite popular in the relational world as a way to implement transactions across multiple databases. The MongoDB website [has an example](http://www.mongodb.org/display/DOCS/two-phase+commit) illustrating the most common scenario (a transfer of funds). The general idea is that you store the state of the transaction within the actual document being updated and go through the init-pending-commit/rollback steps manually. 

MongoDB's support for nested documents and schema-less design makes two-phase commits slightly less painful, but it still isn't a great process, especially when you are just getting started with it. 

### Data Processing ###
MongoDB relies on MapReduce for most data processing jobs. It has some [basic aggregation](http://www.mongodb.org/display/DOCS/Aggregation) capabilities, but for anything serious, you'll want to use MapReduce. In the next chapter we'll look at MapReduce in detail. For now you can think of it as a very powerful and different way to `group by` (which is an understatement). One of MapReduce's strengths is that it can be parallelized for working with large sets of data. However, MongoDB's implementation relies on JavaScript which is single-threaded. The point? For processing of large data, you'll likely need to rely on something else, such as Hadoop. Thankfully, since the two systems really do complement each other, there's a [MongoDB adapter for Hadoop](https://github.com/mongodb/mongo-hadoop).

Of course, parallelizing data processing isn't something relational databases excel at either. There are plans for future versions of MongoDB to be better at handling very large sets of data.

### Geospatial ###
A particularly powerful feature of MongoDB is its support for geospatial indexes. This allows you to store x and y coordinates within documents and then find documents that are `$near` a set of coordinates or `$within` a box or circle. This is a feature best explained via some visual aids, so I invite you to try the [5 minute geospatial interactive tutorial](http://mongly.com/geo/index), if you want to learn more.

### Tools and Maturity ###
You probably already know the answer to this, but MongoDB is obviously younger than most relational database systems. This is absolutely something you should consider. How much a factor it plays depends on what you are doing and how you are doing it. Nevertheless, an honest assessment simply can't ignore the fact that MongoDB is younger and the available tooling around isn't great (although the tooling around a lot of very mature relational databases is pretty horrible too!). As an example, the lack of support for base-10 floating point numbers will obviously be a concern (though not necessarily a show-stopper) for systems dealing with money.

On the positive side, drivers exist for a great many languages, the protocol is modern and simple, and development is happening at blinding speeds. MongoDB is in production at enough companies that concerns about maturity, while valid, are quickly becoming a thing of the past.

### In This Chapter ###
The message from this chapter is that MongoDB, in most cases, can replace a relational database. It's much simpler and straightforward; it's faster and generally imposes fewer restrictions on application developers. The lack of transactions can be a legitimate and serious concern. However, when people ask *where does MongoDB sit with respect to the new data storage landscape?* the answer is simple: **right in the middle**.

\clearpage

## Chapter 6 - MapReduce ##
MapReduce is an approach to data processing which has two significant benefits over more traditional solutions. The first, and main, reason it was development is performance. In theory, MapReduce can be parallelized, allowing very large sets of data to be processed across many cores/CPUs/machines. As we just mentioned, this isn't something MongoDB is currently able to take advantage of. The second benefit of MapReduce is that you get to write real code to do your processing. Compared to what you'd be able to do with SQL, MapReduce code is infinitely richer and lets you push the envelope further before you need to use a more specialized solution.

MapReduce is a pattern that has grown in popularity, and you can make use of it almost anywhere; C#, Ruby, Java, Python and so on all have implementations. I want to warn you that at first this'll seem very different and complicated. Don't get frustrated, take your time and play with it yourself. This is worth understanding whether you are using MongoDB or not.

### A Mix of Theory and Practice ###
MapReduce is a two-step process. First you map and then you reduce. The mapping step transforms the inputted documents and emits a key=>value pair (the key and/or value can be complex). The reduce gets a key and the array of values emitted for that key and produces the final result. We'll look at each step, and the output of each step.

The example that we'll be using is to generate a report of the number of hits, per day, we get on a resource (say a webpage). This is the *hello world* of MapReduce. For our purposes, we'll rely on a `hits` collection with two fields: `resource` and `date`. Our desired output is a breakdown by `resource`, `year`, `month`, `day` and `count`. 

Given the following data in `hits`:

	resource     date
	index        Jan 20 2010 4:30
	index        Jan 20 2010 5:30
	about        Jan 20 2010 6:00
	index        Jan 20 2010 7:00
	about        Jan 21 2010 8:00
	about        Jan 21 2010 8:30
	index        Jan 21 2010 8:30
	about        Jan 21 2010 9:00
	index        Jan 21 2010 9:30
	index        Jan 22 2010 5:00

We'd expect the following output:

	resource  year   month   day   count
	index     2010   1       20    3
	about     2010   1       20    1
	about     2010   1       21    3
	index     2010   1       21    2
	index     2010   1       22    1

(The nice thing about this type of approach to analytics is that by storing the output, reports are fast to generate and data growth is controlled (per resource that we track, we'll add at most 1 document per day.)

For the time being, focus on understanding the concept. At the end of this chapter, sample data and code will be given for you to try on your own.

The first thing to do is look at the map function. The goal of map is to make it emit a value which can be reduced. It's possible for map to emit 0 or more times. In our case, it'll always emit once (which is common). Imagine map as looping through each document in hits. For each document we want to emit a key with resource, year, month and day, and a simple value of 1:

	function() {
		var key = {
		    resource: this.resource, 
		    year: this.date.getFullYear(), 
		    month: this.date.getMonth(), 
		    day: this.date.getDate()
		};
		emit(key, {count: 1}); 
	}

`this` refers to the current document being inspected. Hopefully what'll help make this clear for you is to see what the output of the mapping step is. Using our above data, the complete output would be:

	{resource: 'index', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}, {count:1}]
	{resource: 'about', year: 2010, month: 0, day: 20} => [{count: 1}]
	{resource: 'about', year: 2010, month: 0, day: 21} => [{count: 1}, {count: 1}, {count:1}]
	{resource: 'index', year: 2010, month: 0, day: 21} => [{count: 1}, {count: 1}]
	{resource: 'index', year: 2010, month: 0, day: 22} => [{count: 1}]

Understanding this intermediary step is the key to understanding MapReduce. The values from emit are grouped together, as arrays, by key. .NET and Java developers can think of it as being of type `IDictionary<object, IList<object>>` (.NET) or `HashMap<Object, ArrayList>` (Java).

Let's change our map function in some contrived way:

	function() {
		var key = {resource: this.resource, year: this.date.getFullYear(), month: this.date.getMonth(), day: this.date.getDate()};
		if (this.resource == 'index' && this.date.getHours() == 4) {
			emit(key, {count: 5});
		} else {
			emit(key, {count: 1}); 
		}
	}

The first intermediary output would change to:

	{resource: 'index', year: 2010, month: 0, day: 20} => [{count: 5}, {count: 1}, {count:1}]

Notice how each emit generates a new value which is grouped by our key.

The reduce function takes each of these intermediary results and outputs a final result. Here's what ours looks like:

	function(key, values) {
		var sum = 0;
		values.forEach(function(value) {
			sum += value['count'];
		});
		return {count: sum};
	};

Which would output:

	{resource: 'index', year: 2010, month: 0, day: 20} => {count: 3}
	{resource: 'about', year: 2010, month: 0, day: 20} => {count: 1}
	{resource: 'about', year: 2010, month: 0, day: 21} => {count: 3}
	{resource: 'index', year: 2010, month: 0, day: 21} => {count: 2}
	{resource: 'index', year: 2010, month: 0, day: 22} => {count: 1}

Technically, the output in MongoDB is:

	_id: {resource: 'home', year: 2010, month: 0, day: 20}, value: {count: 3}

Hopefully you've noticed that this is the final result we were after.

If you've really been paying attention, you might be asking yourself *why didn't we simply use `sum = values.length`?* This would seem like an efficient approach when you are essentially summing an array of 1s. The fact is that reduce isn't always called with a full and perfect set of intermediate data. For example, instead of being called with:

	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}, {count:1}]

Reduce could be called with:

	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 1}, {count: 1}]
	{resource: 'home', year: 2010, month: 0, day: 20} => [{count: 2}, {count: 1}]

The final output is the same (3), the path taken is simply different. As such, reduce must always be idempotent. That is, calling reduce multiple times should generate the same result as calling it once. 

We aren't going to cover it here but it's common to chain reduce methods when performing more complex analysis. 

### Pure Practical ###
With MongoDB we use the `mapReduce` command on a collection. `mapReduce` takes a map function, a reduce function and an output directive. In our shell we can create and pass a JavaScript function. From most libraries you supply a string of your functions (which is a bit ugly). First though, let's create our simple data set:

	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 4, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 5, 30)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 20, 6, 0)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 20, 7, 0)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 8, 0)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 8, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 21, 8, 30)});
	db.hits.insert({resource: 'about', date: new Date(2010, 0, 21, 9, 0)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 21, 9, 30)});
	db.hits.insert({resource: 'index', date: new Date(2010, 0, 22, 5, 0)});

Now we can create our map and reduce functions (the MongoDB shell accepts multi-line statements, you'll see *...* after hitting enter to indicate more text is expected):

	var map = function() {
		var key = {resource: this.resource, year: this.date.getFullYear(), month: this.date.getMonth(), day: this.date.getDate()};
		emit(key, {count: 1}); 
	};
	
	var reduce = function(key, values) {
		var sum = 0;
		values.forEach(function(value) {
			sum += value['count'];
		});
		return {count: sum};
	};

Which we can use the `mapReduce` command against our `hits` collection by doing:

	db.hits.mapReduce(map, reduce, {out: {inline:1}})

If you run the above, you should see the desired output. Setting `out` to `inline` means that the output from `mapReduce` is immediately streamed back to us. This is currently limited for results that are 16 megabytes or less. We could instead specify `{out: 'hit_stats'}` and have the results stored in the `hit_stats` collections:

	db.hits.mapReduce(map, reduce, {out: 'hit_stats'});
	db.hit_stats.find();

When you do this, any existing data in `hit_stats` is lost. If we did `{out: {merge: 'hit_stats'}}` existing keys would be replaced with the new values and new keys would be inserted as new documents. Finally, we can `out` using a `reduce` function to handle more advanced cases (such an doing an upsert). 

The third parameter takes additional options, for example we could filter, sort and limit the documents that we want analyzed. We can also supply a `finalize` method to be applied to the results after the `reduce` step.

### In This Chapter ###
This is the first chapter where we covered something truly different. If it made you uncomfortable, remember that you can always use MongoDB's other [aggregation capabilities](http://www.mongodb.org/display/DOCS/Aggregation) for simpler scenarios. Ultimately though, MapReduce is one of MongoDB's most compelling features. The key to really understanding how to write your map and reduce functions is to visualize and understand the way your intermediary data will look coming out of `map` and heading into `reduce`.

\clearpage

## Chapter 7 - Performance and Tools ##
In this last chapter, we look at a few performance topics as well as some of the tools available to MongoDB developers. We won't dive deeply into either topic, but we will examine the most import aspects of each.

### Indexes ###
At the very beginning we saw the special `system.indexes` collection which contains information on all the indexes in our database. Indexes in MongoDB work a lot like indexes in a relational database: they help improve query and sorting performance. Indexes are created via `ensureIndex`:

	db.unicorns.ensureIndex({name: 1});

And dropped via `dropIndex`:

	db.unicorns.dropIndex({name: 1});

A unique index can be created by supplying a second parameter and setting `unique` to `true`:

	db.unicorns.ensureIndex({name: 1}, {unique: true});

Indexes can be created on embedded fields (again, using the dot-notation) and on array fields. We can also create compound indexes:

	db.unicorns.ensureIndex({name: 1, vampires: -1});

The order of your index (1 for ascending, -1 for descending) doesn't matter for a single key index, but it can have an impact for compound indexes when you are sorting or using a range condition.

The [indexes page](http://www.mongodb.org/display/DOCS/Indexes) has additional information on indexes.

### Explain ###
To see whether or not your queries are using an index, you can use the `explain` method on a cursor:

	db.unicorns.find().explain()

The output tells us that a `BasicCursor` was used (which means non-indexed), 12 objects were scanned, how long it took, what index, if any was used as well as a few other pieces of useful information.

If we change our query to use an index, we'll see that a `BtreeCursor` was used, as well as the index used to fulfill the request:

	db.unicorns.find({name: 'Pilot'}).explain()

### Fire And Forget Writes ###
We previously mentioned that, by default, writes in MongoDB are fire-and-forget. This can result in some nice performance gains at the risk of losing data during a crash. An interesting side effect of this type of write is that an error is not returned when an insert/update violates a unique constraint. In order to be notified about a failed write, one must call `db.getLastError()` after an insert. Many drivers abstract this detail away and provide a way to do a *safe* write - often via an extra parameter.

Unfortunately, the shell automatically does safe inserts, so we can't easily see this behavior in action.

### Sharding ###
MongoDB supports auto-sharding. Sharding is an approach to scalability which separates your data across multiple servers. A naive implementation might put all of the data for users with a name that starts with A-M on server 1 and the rest on server 2. Thankfully, MongoDB's sharding capabilities far exceed such a simple algorithm. Sharding is a topic well beyond the scope of this book, but you should know that it exists and that you should consider it should your needs grow beyond a single server.

### Replication ###
MongoDB replication works similarly to how relational database replication works. Writes are sent to a single server, the master, which then synchronizes itself to one or more other servers, the slaves. You can control whether reads can happen on slaves or not, which can help distribute your load at the risk of reading slightly stale data. If the master goes down, a slave can be promoted to act as the new master. Again, MongoDB replication is outside the scope of this book.

 While replication can improve performance (by distributing reads), its main purpose is to increase reliability. Combining replication with sharding is a common approach. For example, each shard could be made up of a master and a slave. (Technically you'll also need an arbiter to help break a tie should two slaves try to become masters. But an arbiter requires very few resources and can be used for multiple shards.)

### Stats ###
You can obtain statistics on a database by typing `db.stats()`. Most of the information deals with the size of your database. You can also get statistics on a collection, say `unicorns`, by typing `db.unicorns.stats()`. Again, most of this information relates to the size of your collection.

### Web Interface ###
Included in the information displayed on MongoDB's startup was a link to a web-based administrative tool (you might still be able to see if if you scroll your command/terminal window up to the point where you started `mongod`). You can access this by pointing your browser to <http://localhost:28017/>. To get the most out of it, you'll want to add `rest=true` to your config and restart the `mongod` process. The web interface gives you a lot of insight into the current state of your server.

### Profiler ###
You can enable the MongoDB profiler by executing:

	db.setProfilingLevel(2);

With it enabled, we can run a command:

	db.unicorns.find({weight: {$gt: 600}});

And then examine the profiler:

	db.system.profile.find()

The output tells us what was run and when, how many documents were scanned, and how much data was returned.

You can disable the profiler by calling `setProfileLevel` again but changing the argument to `0`. Another option is to specify `1` which will only profile queries that take more than 100 milliseconds. Or, you can specify the minimum time, in milliseconds, with a second parameter:

	//profile anything that takes more than 1 second
	db.setProfilingLevel(1, 1000);

###Резервное копирование и восстановление ###
В папке `bin` MongoDB есть утилита `mongodump`. Simply executing `mongodump` will connect to localhost and backup all of your databases to a `dump` subfolder. You can type `mongodump --help` to see additional options. Common options are `--db DBNAME` to back up a specific database and `--collection COLLECTIONAME` to back up a specific collection. You can then use the `mongorestore` executable, located in the same `bin` folder, to restore a previously made backup. Again, the `--db` and `--collection` can be specified to restore a specific database and/or collection. 

For example, to back up our `learn` collection to a `backup` folder, we'd execute (this is its own executable which you run in a command/terminal window, not within the mongo shell itself):

	mongodump --db learn --out backup

To restore only the `unicorns` collection, we could then do:

	mongorestore --collection unicorns backup/learn/unicorns.bson

It's worth pointing out that `mongoexport` and `mongoimport` are two other executables which can be used to export and import data from JSON or CSV. For example, we can get a JSON output by doing:

	mongoexport --db learn -collection unicorns

And a CSV output by doing:

	mongoexport --db learn -collection unicorns --csv -fields name,weight,vampires

Note that `mongoexport` and `mongoimport` cannot always represent your data. Only `mongodump` and `mongorestore` should ever be used for actual backups.

### In This Chapter ###
In this chapter we looked a various commands, tools and performance details of using MongoDB. We haven't touched on everything, but we've looked at the most common ones. Indexing in MongoDB is similar to indexing with relational databases, as are many of the tools. However, with MongoDB, many of these are to the point and simple to use.

\clearpage

## Conclusion ##
You should have enough information to start using MongoDB in a real project. There's more to MongoDB than what we've covered, but your next priority should be putting together what we've learned, and getting familiar with the driver you'll be using. The [MongoDB website](http://www.mongodb.com/) has a lot of useful information. The official [MongoDB user group](http://groups.google.com/group/mongodb-user) is a great place to ask questions.

NoSQL was born not only out of necessity, but also out of an interest to try new approaches. It is an acknowledgement that our field is ever advancing and that if we don't try, and sometimes fail, we can never succeed. This, I think, is a good way to lead our professional lives.