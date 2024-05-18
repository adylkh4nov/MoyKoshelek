﻿
Процедура ОбработкаПроведения(Отказ, РежимПроведения)
	Движение_Денежный(Движения.Денежный);
КонецПроцедуры

Функция Движение_Денежный(Запись)

	Запись.Записывать = Истина;
	Движение = Запись.Добавить();
	Движение.Период = Дата;
	Движение.Валюта = Валюта;
	Движение.Сумма = Сумма;
	Движение.Пояснение = Пояснение;
	Движение.Кошелек = Кошелек;
	Если ВидОперации = Перечисления.ВидыОперации.Доход Тогда
		Движение.ВидДвижения = ВидДвиженияНакопления.Приход;	
	
	ИначеЕсли ВидОперации = Перечисления.ВидыОперации.Расход Тогда
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
	ИначеЕсли ВидОперации = Перечисления.ВидыОперации.ПеремещениеДенежныхСредств Тогда
		// делаем две записи 
		// расход
		Движение.ВидДвижения = ВидДвиженияНакопления.Расход;
		// приход
		ДвижениеПриход = Запись.Добавить();
		ДвижениеПриход.Период = Дата;
		ДвижениеПриход.Валюта = Валюта;
		ДвижениеПриход.Сумма = Сумма;
		ДвижениеПриход.Пояснение = Пояснение;
		ДвижениеПриход.Кошелек = КошелекПриемник;
		ДвижениеПриход.ВидДвижения = ВидДвиженияНакопления.Приход;
		
	КонецЕсли;
	
   	Запись.Записать();
	
КонецФункции

Процедура ПередЗаписью(Отказ, РежимЗаписи, РежимПроведения)
	Если РежимЗаписи = РежимЗаписиДокумента.Запись ИЛИ РежимЗаписи = РежимЗаписиДокумента.Проведение  Тогда
		Если Кошелек = Справочники.Кошельки.ПустаяСсылка() ИЛИ Кошелек = Неопределено Тогда
			Сообщить("Счет не выбран, запись отменена!");
			Отказ = Истина;
			Возврат;	
		КонецЕсли;	
	КонецЕсли;
КонецПроцедуры
