
ПодключитьСценарий("..\src\ПарсерВстроенногоЯзыка\Ext\ObjectModule.bsl", "ПарсерВстроенногоЯзыка");
ПодключитьСценарий("..\plugins\ГенераторДокументацииДляПарсера\src\ГенераторДокументацииДляПарсера\Ext\ObjectModule.bsl", "ГенераторДокументацииДляПарсера");

ЧтениеТекста = Новый ЧтениеТекста("..\src\ПарсерВстроенногоЯзыка\Ext\ObjectModule.bsl");
Исходник = ЧтениеТекста.Прочитать();

ГенераторДокументации = Новый ГенераторДокументацииДляПарсера;

ПарсерВстроенногоЯзыка = Новый ПарсерВстроенногоЯзыка;
Результаты = ПарсерВстроенногоЯзыка.Пуск(Исходник, ГенераторДокументации);

ЗаписьТекста = Новый ЗаписьТекста("..\docs\index.html");
ЗаписьТекста.Записать(СтрСоединить(Результаты));