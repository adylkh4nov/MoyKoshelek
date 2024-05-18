﻿
Процедура ПриЗаписи(Отказ)
	Если НЕ ПометкаУдаления Тогда
		
	
	Если НЕ ЭтоГруппа Тогда
		
		
		// создадим запись в регистре основных кошельков
		РС = РегистрыСведений.ОсновнойКошелек.СоздатьНаборЗаписей();
		РС.Отбор.Кошелек.Установить(Ссылка);
		РС.Прочитать();
		Если РС.Количество() = 0 Тогда
			Запись = РС.Добавить();
			Запись.Период = ТекущаяДата();
			Запись.Кошелек = Ссылка;
			Запись.Основной = Основной;
		ИначеЕсли РС.Количество() = 1 Тогда
			Запись = РС[0];
			Запись.Основной = Основной;
		КонецЕсли;
		РС.Записать(Истина);
		
		// если кошелек выбран основным то очистим записи, чтобы не было других основных
		Если Основной Тогда
			Запрос = Новый Запрос("ВЫБРАТЬ
			|	ОсновнойКошелек.Кошелек КАК Кошелек
			|ИЗ
			|	РегистрСведений.ОсновнойКошелек КАК ОсновнойКошелек
			|ГДЕ
			|	ОсновнойКошелек.Кошелек <> &Кошелек
			|	И ОсновнойКошелек.Основной");
			Запрос.УстановитьПараметр("Кошелек",Ссылка);
			Выборка = Запрос.Выполнить().Выбрать(); 
			Пока Выборка.Следующий() Цикл
				ВыбСсылка = Выборка.Кошелек;
				Объект = ВыбСсылка.ПолучитьОбъект();
				Объект.Основной = Ложь;	
			КонецЦикла;
		КонецЕсли;
		
		Если НачальныйОстаток <> 0 Тогда
			ДокНачальныйОстаток = Документы.НачальныйОстаток.СоздатьДокумент();
			ДокНачальныйОстаток.Дата = ТекущаяДата();
			ДокНачальныйОстаток.Кошелек = Ссылка;
			ДокНачальныйОстаток.Записать(РежимЗаписиДокумента.Проведение);
		КонецЕсли;
	КонецЕсли;
КонецЕсли;
КонецПроцедуры
