﻿
Процедура ПередНачаломРаботыСистемы(Отказ)
	
	БылВходРаньше = ОбщегоНазначения.ПолучитьКонстантуПервогоВхода();
	Если НЕ БылВходРаньше Тогда
		ОткрытьФорму("Обработка.ПриПервомВходеВПрограмму.Форма",,,,,,,РежимОткрытияОкнаФормы.БлокироватьВесьИнтерфейс);
	КонецЕсли;
    
КонецПроцедуры   

