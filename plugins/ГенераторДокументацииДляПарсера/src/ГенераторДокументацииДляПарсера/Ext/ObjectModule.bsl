﻿
// Генератор технической документации по парсеру

Перем Токены, Узлы, Директивы, ИнструкцииПрепроцессора, ТаблицаТокенов, Исходник;
Перем Область, Подобласть, УровеньОбласти;
Перем Комментарии;
Перем Результат;

Процедура Инициализировать(Парсер, Параметры) Экспорт
	Токены = Парсер.Токены();
	Узлы = Парсер.Узлы();
	Директивы = Парсер.Директивы();
	ИнструкцииПрепроцессора = Парсер.ИнструкцииПрепроцессора();
	ТаблицаТокенов = Парсер.ТаблицаТокенов();
	Исходник = Парсер.Исходник();
	Результат = Новый Массив;
	Результат.Добавить(
		"<!DOCTYPE html>
		|<html>
		|<head>
		|<meta http-equiv='Content-Тип' content='text/html; charset=utf-8'>
		|<title>Парсер встроенного языка</title>
		|<link rel='stylesheet' type='text/css' href='ast.css'>
		|</head>
		|<body>
		|<header>
		|<h1>Парсер встроенного языка</h1>
		|</header>
		|<h1>Примеры использования парсера</h1>
		|<pre>
		|
		|// 1С:Предприятие 8.3.13
		|
		|ПарсерВстроенногоЯзыка = ВнешниеОбработки.Создать(ПарсерВстроенногоЯзыкаПуть, Ложь);
		|Плагины = Новый Массив;
		|
		|Плагины.Добавить(ВнешниеОбработки.Создать(ПлагинПуть1, Ложь));
		|Плагины.Добавить(ВнешниеОбработки.Создать(ПлагинПуть2, Ложь));
		|
		|ПарсерВстроенногоЯзыка.Пуск(Исходник.ПолучитьТекст(), Плагины);
		|
		|Отчет = Новый Массив;
		|Для Каждого Ошибка Из Парсер.ТаблицаОшибок() Цикл
		|	Отчет.Добавить(Ошибка.Текст);
		|	Отчет.Добавить(СтрШаблон("" [стр: %1; кол: %2]"", Ошибка.НомерСтрокиНачала, Ошибка.НомерКолонкиНачала));
		|	Отчет.Добавить(Символы.ПС);
		|КонецЦикла;
		|Сообщить(СтрСоединить(Отчет));
		|
		|// OneScript
		|
		|ПодключитьСценарий(""..\src\ПарсерВстроенногоЯзыка\Ext\ObjectМодуль.bsl"", ""ПарсерВстроенногоЯзыка"");
		|ПодключитьСценарий(""..\plugins\ДетекторНеиспользуемыхПеременных\src\ДетекторНеиспользуемыхПеременных\Ext\ObjectМодуль.bsl"", ""ДетекторНеиспользуемыхПеременных"");
		|
		|ЧтениеТекста = Новый ЧтениеТекста(""..\src\ПарсерВстроенногоЯзыка\Ext\ObjectМодуль.bsl"");
		|Исходник = ЧтениеТекста.Прочитать();
		|
		|Парсер = Новый ПарсерВстроенногоЯзыка;
		|Плагин = Новый ДетекторНеиспользуемыхПеременных;
		|Парсер.Пуск(Исходник, Плагин);
		|
		|Отчет = Новый Массив;
		|Для Каждого Ошибка Из Парсер.ТаблицаОшибок() Цикл
		|	Отчет.Добавить(Ошибка.Текст);
		|	Отчет.Добавить(СтрШаблон("" [стр: %1; кол: %2]"", Ошибка.НомерСтрокиНачала, Ошибка.НомерКолонкиНачала));
		|	Отчет.Добавить(Символы.ПС);
		|КонецЦикла;
		|Сообщить(СтрСоединить(Отчет));
		|
		|</pre>
		|<h1>Шаблон плагина</h1>
		|<pre>
		|Перем Узлы;
		|Перем Токены;
		|Перем Исходник;
		|Перем ТаблицаТокенов;
		|Перем Директивы;
		|Перем ИнструкцииПрепроцессора;
		|Перем СимволыПрепроцессора;
		|Перем ТаблицаОшибок;
		|Перем ТаблицаЗамен;
		|
		|Перем Результат;
		|
		|// Будет вызвана один раз перед обходом дерева.
		|Процедура Инициализировать(Парсер, Параметры) Экспорт
		|	Узлы = Парсер.Узлы();
		|	Токены = Парсер.Токены();
		|	Исходник = Парсер.Исходник();
		|	ТаблицаТокенов = Парсер.ТаблицаТокенов();
		|	Директивы = Парсер.Директивы();
		|	ИнструкцииПрепроцессора = Парсер.ИнструкцииПрепроцессора();
		|	СимволыПрепроцессора = Парсер.СимволыПрепроцессора();
		|	ТаблицаОшибок = Парсер.ТаблицаОшибок();
		|	ТаблицаЗамен = Парсер.ТаблицаЗамен();
		|	Результат = Новый Массив;
		|КонецПроцедуры // Инициализировать()
		|
		|// Будет вызвана после полного обхода дерева.
		|// Возвращает текстовый результат работы плагина, если он есть.
		|Функция Закрыть() Экспорт
		|	// ...
		|	Возврат СтрСоединить(Результат);
		|КонецФункции // Закрыть()
		|
		|// Возвращает список процедур-подписок, которые будут вызываться визитером.
		|// Состав возможных подписок можно посмотреть в парсере в функции Подписки().
		|Функция Подписки() Экспорт
		|	Перем Подписки;
		|	Подписки = Новый Массив;
		|	//Подписки.Добавить(""ПосетитьОператорПрисваивания"");
		|	//Подписки.Добавить(""ПокинутьОператорПрисваивания"");
		|	Возврат Подписки;
		|КонецФункции // Подписки()
		|
		|#Область РеализацияПодписок
		|
		|//Процедура ПосетитьОператорПрисваивания(ОператорПрисваивания) Экспорт
		|//	Ошибка(""Ошибка в операторе присваивания"", ОператорПрисваивания.Начало, ОператорПрисваивания.Конец);
		|//КонецПроцедуры // ПосетитьОператорПрисваивания()
		|
		|//Процедура ПокинутьОператорПрисваивания(ОператорПрисваивания) Экспорт
		|//
		|//КонецПроцедуры // ПокинутьОператорПрисваивания()
		|
		|#КонецОбласти // РеализацияПодписок
		|
		|Процедура Ошибка(Текст, ИндексНачала, ИндексКонца = Неопределено, ЕстьЗамена = Ложь)
		|	Начало = ТаблицаТокенов[ИндексНачала];
		|	Ошибка = ТаблицаОшибок.Добавить();
		|	Ошибка.Источник = ""ИмяЭтогоПлагина"";
		|	Ошибка.Текст = Текст;
		|	Ошибка.ПозицияНачала = Начало.Начало;
		|	Ошибка.НомерСтрокиНачала = Начало.НомерСтроки;
		|	Ошибка.НомерКолонкиНачала = Начало.НомерКолонки;
		|	Если ИндексКонца = Неопределено Или ИндексКонца = ИндексНачала Тогда
		|		Ошибка.ПозицияКонца = Начало.Конец;
		|		Ошибка.НомерСтрокиКонца = Начало.НомерСтроки;
		|		Ошибка.НомерКолонкиКонца = Начало.НомерКолонки + Начало.Длина;
		|	Иначе
		|		Конец = ТаблицаТокенов[ИндексКонца];
		|		Ошибка.ПозицияКонца = Конец.Конец;
		|		Ошибка.НомерСтрокиКонца = Конец.НомерСтроки;
		|		Ошибка.НомерКолонкиКонца = Конец.НомерКолонки + Конец.Длина;
		|	КонецЕсли;
		|	Ошибка.ЕстьЗамена = ЕстьЗамена;
		|КонецПроцедуры
		|
		|Процедура Замена(Текст, Начало, Конец)
		|	НоваяЗамена = ТаблицаЗамен.Добавить();
		|	НоваяЗамена.Источник = ""ИмяЭтогоПлагина"";
		|	НоваяЗамена.Текст = Текст;
		|	НоваяЗамена.Начало = Начало;
		|	НоваяЗамена.Конец = Конец;
		|КонецПроцедуры
		|
		|</pre>"
		""
	);
	УровеньОбласти = 0;
КонецПроцедуры // Инициализировать()

Функция Закрыть() Экспорт
	Результат.Добавить(
		"<h2 id='#Прочее'>#Прочее</h2>
		|<h3 id='Доступность'>Доступность</h3>
		|<ul>
		| <li><strong>Клиент</strong>: булево</li>
		| <li><strong>ВнешнееСоединение</strong>: булево</li>
		| <li><strong>МобильноеПриложение</strong>: булево</li>
		| <li><strong>МобильныйКлиент</strong>: булево</li>
		| <li><strong>МобильныйСервер</strong>: булево</li>
		| <li><strong>Сервер</strong>: булево</li>
		| <li><strong>ТолстыйКлиент</strong>: булево</li>
		| <li><strong>ТонкийКлиент</strong>: булево</li>
		| <li><strong>ВебКлиент</strong>: булево</li>
		| <li><strong>Интеграция</strong>: булево</li>
		|</ul>
		|</body>
		|</html>"
	);
	Результат.Добавить("<h2 id='#Перечисления'>#Перечисления</h2>");
	Результат.Добавить(СгенерироватьПеречисление("Директивы", Директивы));
	Результат.Добавить(СгенерироватьПеречисление("ИнструкцииПрепроцессора", ИнструкцииПрепроцессора));
	//Результат.Добавить(СгенерироватьПеречисление("Узлы", Узлы, Истина));
	Результат.Добавить(СгенерироватьПеречисление("Токены", Токены));
	Возврат СтрСоединить(Результат);
КонецФункции // Закрыть()

Функция СгенерироватьПеречисление(Имя, Перечисление, Ссылка = Ложь)
	Перем Буфер;
	Буфер = Новый Массив;
	Буфер.Добавить(СтрШаблон(
		"<h3 id='%1'>%1</h3>
		|<ul>",
		Имя
	));
	ЗначенияПеречисления = Новый Структура;
	Для Каждого Элемент Из Перечисление Цикл
		ЗначенияПеречисления.Вставить(Элемент.Значение);
	КонецЦикла;
	Для Каждого Элемент Из ЗначенияПеречисления Цикл
		Если Ссылка Тогда
			Буфер.Добавить(СтрШаблон("<li>""<a href='#%1'>%1</a>""</li>" "", Элемент.Key));
		Иначе
			Буфер.Добавить(СтрШаблон("<li>""%1""</li>" "", Элемент.Key));
		КонецЕсли;
	КонецЦикла;
	Буфер.Добавить("</ul>" "");
	Возврат СтрСоединить(Буфер);
КонецФункции // GenerateEnum()

Функция Подписки() Экспорт
	Перем Подписки;
	Подписки = Новый Массив;
	Подписки.Добавить("ПосетитьИнструкциюПрепроцессора");
	Подписки.Добавить("ПосетитьВыражениеНовый");
	Возврат Подписки;
КонецФункции // Подписки()

Процедура ПосетитьИнструкциюПрепроцессора(ИнструкцияПрепроцессора) Экспорт
	Если ИнструкцияПрепроцессора.Тип = Узлы.ИнструкцияПрепроцессораОбласть Тогда
		Если УровеньОбласти = 0 Тогда
			Область = ИнструкцияПрепроцессора.Имя;
			Подобласть = "";
			Если Область = "АбстрактноеСинтаксическоеДерево" Тогда
				Результат.Добавить("	<h1>Абстрактное синтаксическое дерево</h1>" "");
				Результат.Добавить(СгенерироватьПеречисление("Узлы", Узлы, Истина));
			КонецЕсли;
		ИначеЕсли УровеньОбласти = 1 Тогда
			Подобласть = ИнструкцияПрепроцессора.Имя;
			Если Область = "АбстрактноеСинтаксическоеДерево" Тогда
				Результат.Добавить(СтрШаблон("	<h2 id='#%1'>#%1</h2>" "", Подобласть));
			КонецЕсли;
		КонецЕсли;
		УровеньОбласти = УровеньОбласти + 1;
	ИначеЕсли ИнструкцияПрепроцессора.Тип = Узлы.ИнструкцияПрепроцессораКонецОбласти Тогда
		УровеньОбласти = УровеньОбласти - 1;
		Если УровеньОбласти = 0 Тогда
			Область = "";
		ИначеЕсли УровеньОбласти = 1 Тогда
			Подобласть = "";
		КонецЕсли;
	КонецЕсли;
КонецПроцедуры // ПосетитьИнструкциюПрепроцессора()

Функция НайтиКомментарийСтроки(Знач ИндексТокена)
	СтрокаТаблицы = ТаблицаТокенов[ИндексТокена];
	НомерСтроки = СтрокаТаблицы.НомерСтроки;
	Пока СтрокаТаблицы.НомерСтроки = НомерСтроки
		И СтрокаТаблицы.Токен <> Токены.Комментарий Цикл
		ИндексТокена = ИндексТокена + 1;
		СтрокаТаблицы = ТаблицаТокенов[ИндексТокена];
	КонецЦикла;
	Если СтрокаТаблицы.Токен = Токены.Комментарий Тогда
		Возврат Сред(Исходник, СтрокаТаблицы.Начало, СтрокаТаблицы.Длина);
	КонецЕсли;
	Возврат Неопределено;
КонецФункции

Процедура ПосетитьВыражениеНовый(ВыражениеНовый) Экспорт

	Если Область = "АбстрактноеСинтаксическоеДерево" Тогда

		Если ВыражениеНовый.Имя = "Структура" Тогда

			Тэг = НайтиКомментарийСтроки(ВыражениеНовый.Начало);
			Если Тэг <> Неопределено И СтрНайти(Тэг, "@Узел") Тогда

				СписокОписаний = Новый СписокЗначений;

				ИндексТокена = ВыражениеНовый.Начало - 2;
				СтрокаТаблицы = ТаблицаТокенов[ИндексТокена];
				Пока СтрокаТаблицы.Токен = Токены.Комментарий Цикл
					СписокОписаний.Вставить(0, Сред(Исходник, СтрокаТаблицы.Начало, СтрокаТаблицы.Длина));
					ИндексТокена = ИндексТокена - 1;
					СтрокаТаблицы = ТаблицаТокенов[ИндексТокена];
				КонецЦикла;

				ПоляУзла = ВыражениеНовый.Аргументы[0].Элементы;
				УзелИмя = ВыражениеНовый.Аргументы[1].Хвост[0].Имя;

				Результат.Добавить(СтрШаблон(
					"	<h3 id='%1'>%1<a class='permalink' href='#%1'>¶</a></h3>
					|	<ul>" "",
					УзелИмя
				));

				КоличествоОписаний = СписокОписаний.Количество();
				Индекс = 0;
				Пока Индекс < КоличествоОписаний Цикл
					Элемент = СписокОписаний[Индекс];
					Если СокрЛП(Элемент.Значение) = "<pre>" Тогда
						Буфер = Новый Массив;
						Пока СокрЛП(Элемент.Значение) <> "</pre>" Цикл
							Буфер.Добавить(Элемент.Значение);
							Индекс = Индекс + 1;
							Элемент = СписокОписаний[Индекс];
						КонецЦикла;
						Результат.Добавить(СтрСоединить(Буфер, Символы.ПС));
						Результат.Добавить("</pre>");
					Иначе
						Результат.Добавить(СтрШаблон("	<i>%1</i><br>" "", Элемент.Значение));
					КонецЕсли;
					Индекс = Индекс + 1;
				КонецЦикла;

				Результат.Добавить("	<p>");

				Для Каждого Поле Из ПоляУзла Цикл
					ИмяПоля = СокрЛП(Поле.Значение);
					Если Прав(ИмяПоля, 1) = "," Тогда
						ИмяПоля = Left(ИмяПоля, СтрДлина(ИмяПоля) - 1);
					КонецЕсли;
					СписокТипов = РазобратьТипы(НайтиКомментарийСтроки(Поле.Начало));
					Результат.Добавить(СтрШаблон(
						"		<li><strong>%1</strong>: %2%3</li>" "",
						ИмяПоля,
						СгенерироватьСписокТипов(СписокТипов),
						?(ИмяПоля = "Тип", " = Узлы." + УзелИмя, "")
					));
				КонецЦикла;

				Результат.Добавить("	</ul>" "");

			КонецЕсли;

		КонецЕсли;

	КонецЕсли;

КонецПроцедуры

Функция СгенерироватьСписокТипов(СписокТипов)
	Перем Буфер;
	Буфер = Новый Массив;
	Для Каждого Элемент Из СписокТипов Цикл
		Если Элемент.Ребенок = Неопределено Тогда
			Если Lower(Элемент.Идентификатор) = Элемент.Идентификатор Тогда
				Буфер.Добавить(Элемент.Идентификатор);
			Иначе
				Буфер.Добавить(СтрШаблон(
					"<a href='#%1'>%1</a>",
					Элемент.Идентификатор
				));
			КонецЕсли;
		ИначеЕсли ТипЗнч(Элемент.Ребенок) = Тип("Строка") Тогда
			Буфер.Добавить(СтрШаблон(
				"%1 <a href='#%2'>%2</a>",
				Элемент.Идентификатор,
				Элемент.Ребенок
			));
		Иначе
			Буфер.Добавить(СтрШаблон(
				"%1 (%2)",
				Элемент.Идентификатор,
				СгенерироватьСписокТипов(Элемент.Ребенок)
			));
		КонецЕсли;
	КонецЦикла;
	Возврат СтрСоединить(Буфер, ", ");
КонецФункции

#Область ПарсерТипов

Функция РазобратьТипы(Типы)
	Перем Позиция, Идентификатор, Список;
	Позиция = 1; Список = Новый Массив;
	Пока Истина Цикл
		Ребенок = Неопределено;
		ПропуститьНевидимыеСимволы(Типы, Позиция);
		Идентификатор = СканироватьИдентификатор(Типы, Позиция);
		ПропуститьНевидимыеСимволы(Типы, Позиция);
		Если Идентификатор = "один" Тогда
			Если Сред(Типы, Позиция, 2) <> "из" Тогда
				ВызватьИсключение "ошибка";
			КонецЕсли;
			Позиция = Позиция + 2;
			Идентификатор = "один из";
			ПропуститьНевидимыеСимволы(Типы, Позиция);
			Ребенок = СканироватьИдентификатор(Типы, Позиция);
		ИначеЕсли Сред(Типы, Позиция, 1) = "(" Тогда
			Позиция = Позиция + 1;
			Beg = Позиция;
			ПропуститьДо(Типы, Позиция, ")");
			Ребенок = РазобратьТипы(Mid(Типы, Beg, Позиция - Beg));
			Позиция = Позиция + 1;
		КонецЕсли;
		Список.Добавить(Новый Структура("Идентификатор, Ребенок", Идентификатор, Ребенок));
		Если Сред(Типы, Позиция, 1) <> "," Тогда
			Прервать;
		КонецЕсли;
		Позиция = Позиция + 1;
	КонецЦикла;
	Возврат Список;
КонецФункции

Процедура ПропуститьНевидимыеСимволы(Строка, Позиция)
	Для Позиция = Позиция По СтрДлина(Строка) Цикл
		Если Не ПустаяСтрока(Mid(Строка, Позиция, 1)) Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

Процедура ПропуститьДо(Строка, Позиция, Символ)
	Для Позиция = Позиция По СтрДлина(Строка) Цикл
		Если Сред(Строка, Позиция, 1) = Символ Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

Функция СканироватьИдентификатор(Строка, Позиция)
	Перем Начало, Символ;
	Начало = Позиция;
	Для Позиция = Позиция По СтрДлина(Строка) Цикл
		Символ = Сред(Строка, Позиция, 1);
		Если ПустаяСтрока(Символ) Или Символ = "," Тогда
			Прервать;
		КонецЕсли;
	КонецЦикла;
	Возврат Сред(Строка, Начало, Позиция - Начало);
КонецФункции

#КонецОбласти // ПарсерТипов