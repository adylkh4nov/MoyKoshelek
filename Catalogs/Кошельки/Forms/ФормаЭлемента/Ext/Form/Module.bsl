﻿
&НаКлиенте
Процедура НачальныйОстатокПриИзменении(Элемент)
	Если Объект.НачальныйОстаток <> 0 Тогда
		Объект.ДатаНачальногоОстатка = ТекущаяДата();		
	Иначе
		Объект.ДатаНачальногоОстатка = '00000000000000';	
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)
	
	Если ПервыйВход() Тогда
		Объект.Основной = Истина;
		Объект.Активность = Истина;
		Возврат;
	КонецЕсли;
	
	Запрос = Новый Запрос("ВЫБРАТЬ
		                      |	ОсновнойКошелек.Основной КАК Основной
		                      |ИЗ
		                      |	РегистрСведений.ОсновнойКошелек КАК ОсновнойКошелек
		                      |ГДЕ
		                      |	ОсновнойКошелек.Кошелек = &Кошелек");
	Запрос.УстановитьПараметр("Кошелек",Объект.Ссылка);
	Выборка = Запрос.Выполнить().Выбрать();
	Если Выборка.Следующий() Тогда
		
		Объект.Основной = Выборка.Основной;	
	
	КонецЕсли;
	
КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Если ПервыйВход() Тогда
		Элементы.ДекорацияОсновной.Видимость = Истина;
		Элементы.Основной.ТолькоПросмотр = Истина;
	Иначе
		Элементы.ГруппаНачальныйОстаток.Видимость = Ложь;
		Элементы.ДекорацияОсновной.Видимость = Ложь;
		
	КонецЕсли;
КонецПроцедуры 

Функция ПервыйВход()

	Если НЕ Константы.БылВходРаньше.Получить() Тогда
		Возврат Истина;
	Иначе
		Возврат Ложь
	КонецЕсли;	

КонецФункции // ПроверитьПервыйВход()


&НаКлиенте
Процедура ПриЗакрытии(ЗавершениеРаботы)
	//Вставить содержимое обработчика
КонецПроцедуры

