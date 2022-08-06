# ПРИЛОЖЕНИЕ TODO LIST

#### Ссылка на загрузку (Android):

## UI:
#### Экран "Мои дела"

<img src="https://s4.gifyu.com/images/SNIMOK-EKRANA-2022-08-06-V-04.17.08.png" alt="drawing" width="200"/>

    На этом экране имеется SliverAppBar с названием экрана,
    надписью Выполнено - с количеством дел, отмеченных как выполненные,
    которая высвечивается только при развернутом SliverAppBar,
    а так же кнопочка с глазом, позволяющая скрыть/раскрыть выполненные дела
    Ниже расположена карточка с делами, дело можно свайпнуть влево, чтобы удалить
    или вправо, чтобы отметить выполненным.
    Анимации перемещения иконок удаления/сабмита присутствуют.

![](https://s4.gifyu.com/images/ezgif.com-gif-makerb431f6088e6701d9.gif)

    Дело можно отметить выполненным по нажатию на чекбокс, или на панельку
    этого дела. По нажатию на иконку инфо можно перейти на экран редактирования
    дела.
    В конце списка дел расположена кнопка "Новое", а в правой нижней части экрана
    кнопка с иконкой +.
    По нажатию по этим кнопкам происходит переход на экран добавления дела.

#### Экран "Добавления/Редактирования дела"

<img src="https://s4.gifyu.com/images/SNIMOK-EKRANA-2022-08-06-V-04.24.07.png" alt="drawing" width="200"/>

    На данном экране также имеется SliverAppBar с кнопкой X - закрывающей
    экран без сохранения данных и кнопкой СОХРАНИТЬ, сохраняющей изменения,
    а затем закрывающей экран.
    Новое дело нельзя сохранить без текста, при попытке сохранения высветится
    соответствующий диалог.
    Ниже имеется поле для ввода текста дела, кнопка выбора важности,
    Переключатель, при включении которого предлагается выбрать дедлайн для
    дела в календаре, а также кнопка удалить, неактивная если экран открыт для
    создания нового дела

## DATA:
#### Local - пакет sqflite
#### WEB - для запросов используется пакет dio
#### Синхронизация
    Приложение работает без интернета, синхронизация пройдет при подключении.
    При удалении дела, оно локально помечается удаленным, а затем после
    успешного удаления на сервере удаляется окончательно. При обновлении/добавлении
    дела, оно сначала сохраняется локально, затем отправляется на сервер соответсвующим
    методом, при ошибке доотправляет методом patch.
    При старте приложения сначала проходит удаление с сервера дел, помеченных
    локально удаленными, затем с сервера происходит получение дел, которые
    добавляют или обновляют (если created_at на сервере больше чем в локалке)
    дела в локальной базе данных. А затем происходит обновление дел сервера 
    при помощи patch.
#### Консистентность
    Данные автоматически обновляются на обоих экранах.

## Firebase
#### Crashlytics
    Настроен и работает
#### Remote Config
    По изменению интового параметра 'color' в консоли, при перезапуске приложения
    меняет дефолтный красный цвет на введенный.

## Структура проекта
    Используется layer-first

## Разное
    У приложения есть иконка ;)
    Интернационализация: используется пакет intl
    Логирование при помощи пакета logging
    


