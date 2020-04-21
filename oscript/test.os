// Пример скрипта выполняющего проверку исходного кода

// Сначала подключаем обработку парсера

ПодключитьСценарий("..\src\ПарсерВстроенногоЯзыка\Ext\ObjectModule.bsl", "ПарсерВстроенногоЯзыка");

// и обработки необходимых плагинов (набор просто для демонстрации работы с несколькими плагинами).

// Плагин, проверяющий наличие неиспользуемых переменных:
ПодключитьСценарий("..\plugins\ДетекторНеиспользуемыхПеременных\src\ДетекторНеиспользуемыхПеременных\Ext\ObjectModule.bsl", "ДетекторНеиспользуемыхПеременных");
// Плагин, проверяющий что в окончаниях инструкций стоит актуальный комментарий:
ПодключитьСценарий("..\plugins\ДетекторОшибочныхЗамыкающихКомментариев\src\ДетекторОшибочныхЗамыкающихКомментариев\Ext\ObjectModule.bsl", "ДетекторОшибочныхЗамыкающихКомментариев");
// Плагин, проверяющий наличие возвратов в конце функций:
ПодключитьСценарий("..\plugins\ДетекторФункцийБезВозвратаВКонце\src\ДетекторФункцийБезВозвратаВКонце\Ext\ObjectModule.bsl", "ДетекторФункцийБезВозвратаВКонце");

// Далее читаем исходный код, который хотим проверить.
ЧтениеТекста = Новый ЧтениеТекста("..\src\ПарсерВстроенногоЯзыка\Ext\ObjectModule.bsl");
Исходник = ЧтениеТекста.Прочитать();
ЧтениеТекста.Закрыть();

// собираем нужные плагины в массив
Плагины = Новый Массив;
Плагины.Добавить(Новый ДетекторНеиспользуемыхПеременных);
Плагины.Добавить(Новый ДетекторОшибочныхЗамыкающихКомментариев);
Плагины.Добавить(Новый ДетекторФункцийБезВозвратаВКонце);

// Запуск проверки на данном исходном коде (Исходник) с желаемым набором плагинов (Плагины).
Парсер = Новый ПарсерВстроенногоЯзыка;
Парсер.Пуск(Исходник, Плагины);

// Выводим результаты работы плагинов.
Отчет = Новый Массив;
Для Каждого Ошибка Из Парсер.ТаблицаОшибок() Цикл
	Отчет.Добавить(Ошибка.Текст);
	Отчет.Добавить(СтрШаблон(" [стр: %1; кол: %2]", Ошибка.НомерСтрокиНачала, Ошибка.НомерКолонкиНачала));
	Отчет.Добавить(Символы.ПС);
КонецЦикла;
Сообщить(СтрСоединить(Отчет));