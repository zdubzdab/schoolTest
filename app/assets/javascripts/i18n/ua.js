I18n.translations || (I18n.translations = {});
I18n.translations["ua"] = I18n.extend((I18n.translations["ua"] || {}), {"activerecord":{"attributes":{"comment":{"name":"Заголовок","text":"Текст"},"questions/answer_settings":{"name":"Відповідь"},"test_setting":{"name":"Назва","time_to_pass":"Час виконання"},"test_setting/questions":{"text":"Запитання"},"tiding":{"text":"Текст","title":"Заголовок"},"user":{"categgory_id":"Клас","current_password":"Поточний пароль","email":"Емейл","full_name":"Прізвище Ім'я Побатькові","password":"Пароль","password_confirmation":"Підтвердження паролю","subject_id":"Предмет"}},"errors":{"models":{"comment":{"attributes":{"name":{"blank":"не може бути пустим"},"text":{"blank":"не може бути пустим"}}},"test_setting":{"attributes":{"name":{"blank":"не може бути пустою"},"text":{"blank":"не може бути пустим"},"time_to_pass":{"blank":"не може бути пустим"}}},"tiding":{"attributes":{"text":{"blank":"не може бути пустим"},"title":{"blank":"не може бути пустим","taken":"вже існує","too_short":"занадто короткий (мінімум три символи)"}}},"user":{"attributes":{"current_password":{"blank":"не може бути пустим","invalid":"неправильний"},"email":{"bad_email_format":"має бути такого формату: xxx@xxx.xxx","blank":"не може бути пустим","taken":"вже занятий"},"full_name":{"blank":"не може бути пустим","taken":"вже занятий","too_short":"занадто коротке (мінімум три символи)"},"password":{"blank":"не може бути пустим","confirmation":"Паролі не співпадають","too_short":"занадто короткий(мінімум %{count} символів)"},"password_confirmation":{"confirmation":"пароль не співпадає"}}}}},"models":{"question":"питання","test_setting":"тест","test_settings":"тести","tiding":"новина","tidings":"новини","user":"користувача","users":"користувачів"}},"admin":{"comments":{"comments":{"guest":"Гість"},"destroy":{"controllers":{"error":"Ви не можете видалити цю пропозицію."}},"index":{"buttons":{"back":"Назад"},"h_suggestions_list":"Список пропозицій"}},"students":{"destroy":{"controllers":{"error":"Ви не можете видалити цього учня."}},"edit":{"buttons":{"back":"Назад","submit":"Зберегти"},"h_edit":"Редагування учня"},"index":{"buttons":{"back":"Назад"},"email":"Емейл","h_students":"Учні","name":"Прізвище Ім'я Побатькові","photo":"Фото"},"students":{"class":"Клас","destroy":"Видалити","destroy_certain":"Ви впевнені, що хочете видалити даного учня?","edit":"Редагувати","email":"Емейл","name":"Прізвище Ім'я Побатькові"}},"tidings":{"destroy":{"controllers":{"error":"Ви не можете видалити цю новину."}},"edit":{"buttons":{"add_photo":"Додати фотографію","back":"Назад","submit":"Зберегти"},"choose_photos":"Виберіть фотографії","h_edit_new":"Редагування новини","mark_if_right":"Позначте, якщо новина головна"},"form":{"buttons":{"add_photo":"Додати фотографію","submit":"Зберегти"},"choose_photos":"Виберіть фотографії і поставте позначку біля тієї, яка має відображатися першою","mark_if_right":"Позначте, якщо новина головна"},"image_fields":{"buttons":{"remove":"Видалити"}},"index":{"buttons":{"back":"Назад"},"h_news_list":"Список новин"},"new":{"buttons":{"back":"Назад"},"h_news_creation":"Створення новини"},"show":{"buttons":{"back":"Назад"}},"tidings":{"buttons":{"destroy":"Назад","edit":"Назад"},"destroy":"Видалити","destroy_certain":"Ви впевнені, що хочете видалити дану новину?","edit":"Редагувати","name":"Назва","text":"Текст","time":"Час створеня"}},"users":{"edit":{"avatar":"Фото","buttons":{"back":"Назад","submit":"Зберегти"},"delete_avatar":"Видалити фото","h_edit":"Редагування вчителя"},"index":{"buttons":{"back":"Назад"},"controllers":{"error":"Ви не можете видалити цього вчителя."},"email":"Емейл","h_teachers":"Наші вчителі","name":"Прізвище Ім'я Побатькові","photo":"Фото"},"users":{"buttons":{"destroy":"Видалити","edit":"Редагувати"},"confirm_destroy":"Ви впевнені, що хочете видалити даного вчителя?","destroy":"Видалити","edit":"Редагувати","email":"Емейл","name":"Прізвище Ім'я Побатькові","photo":"Фото"}}},"comments":{"create":{"controllers":{"sucessful":"Ваша пропозиція успішно створена і буде розглянута найближчим часом."}},"form":{"buttons":{"submit":"Додати пропозицію"}},"new":{"buttons":{"back":"Назад"},"h_add_suggestions":"Створення пропозицій"}},"devise":{"confirmations":{"confirmed":"Ваш обліковий запис підтверджено. Ви увійшли в систему.","send_instructions":"Ви отримаєте лист з інструкціями по підтвердженню вашого облікового запису протягом декількох хвилин.","send_paranoid_instructions":"Якщо Ваша email адреса існує в нашій базі даних, то протягом декількох хвилин Ви отримаєте лист з інструкціями по підтвердженню Вашого облікового запису."},"failure":{"already_authenticated":"Ви вже увійшли в систему.","inactive":"Ваш обліковий запис ще не активований.","invalid":"Невірний email чи пароль.","invalid_token":"Невірний ключ аутентифікації.","locked":"Ваш обліковий запис заблоковано.","not_found_in_database":"Невірний email чи пароль.","timeout":"Час вашої сесії вичерпано. Будь-ласка, увійдіть в систему знову.","unauthenticated":"Вам необхідно увійти в систему чи зареєструватися.","unconfirmed":"Ви маєте підтвердити Ваш обліковий запис."},"mailer":{"confirmation_instructions":{"subject":"Інструкції з підтвердження облікового запису"},"reset_password_instructions":{"subject":"Інструкції з відновлення паролю"},"unlock_instructions":{"subject":"Інструкції з розблокування облікового запису"}},"omniauth_callbacks":{"failure":"Ви не можете увійти в систему з облікового запису %{kind}, так як \"%{reason}\".","success":"Вхід в систему з облікового запису %{kind} успішний."},"passwords":{"format":"Невірний формат - має складати мінімум 8 символів, у тому числі одну прописну букву, рядкову букву і цифру.","new":{"buttons":{"send_me":"Надіслати"},"h_forgot_password":"Забули пароль?","on_this_address":"На цю адресу ми надішлемо інструкції для відновлення паролю"},"no_token":"Ця сторінка доступна тільки при переході з email для скидання паролю. Якщо Ви перейшли по посиланню з листа, будь-ласка, переконайтесь, що Ви використовували повний URL.","send_instructions":"Протягом декількох хвилин Ви отримаєте лист з інструкціями по скиданню Вашого паролю.","send_paranoid_instructions":"Якщо Ваша email адреса існує в нашій базі даних, то протягом декількох хвилин Ви отримаєте лист з інструкціями по відновленню Вашого паролю.","updated":"Ваш пароль було змінено. Ви увійшли в систему.","updated_not_active":"Ваш пароль було змінено успішно."},"registrations":{"destroyed":"До побачення! Ваш обліковий запис був успішно видалений. Сподіваємось незабаром побачитись з Вами знову.","edit":{"are_you_sure":"Ви впевнені?","avatar":"Фото","buttons":{"back":"Назад","cancel_account":"Відмінити мій акаунт","student":"Учень","submit":"Зберегти зміни","teacher":"Вчитель"},"choose_avatar":"Вибрати фото","h_cancel_account":"Відмінити мій акаунт","h_edit":"Редагування профілю","leave_blank":"(Залиште пустим якщо не хочете змінювати)","unhappy":"Незадоволені?","we_need_password":"(нам потрібен ваш поточний пароль для підтвердження ваших змін)"},"new":{"buttons":{"back":"Назад","student":"Учень","submit":"Реєстрація","teacher":"Вчитель"},"choose_avatar":"Виберіть фото","h_registration":"Реєстрація","min_password_length":"мінімум 8 символів"},"signed_up":"Ласкаво просимо! Ви успішно зареєструвалися.","signed_up_but_inactive":"Ви успішно зареєструвалися, але Ви не можете увійти в систему тому, що Ваш обліковий запис ще не активований.","signed_up_but_locked":"Ви успішно зареєструвалися, але Ви не можете увійти в систему тому, що Ваш обліковий запис заблоковано.","signed_up_but_unconfirmed":"Ви отримаєте лист з інструкціями по підтвердженню вашого облікового запису протягом декількох хвилин.","update_needs_confirmation":"Ваш обліковий запис оновлено успішно, але необхідно підтвердити Вашу нову email адресу. Будь-ласка, перевірте свою електронну скриньку і перейдіть за посиланням \"Підтвердити\", шоб завершити оновлення email адреси.","updated":"Ваш обліковий запис змінено."},"sessions":{"new":{"buttons":{"submit":"Авторизація"},"h_log_in":"Авторизація","remember":"Запам'ятати мене"},"signed_in":"Ви увійшли в систему.","signed_out":"Ви вийшли з системи."},"shared":{"links":{"buttons":{"come_from":"Зайти із#{provider.to_s.titleize}","dont_resive_instructions":"Не отримали інструкції для підтвердження акаунту?","dont_resive_instructions_to_unbloc":"Не отримали інструкції для розблокуванння акаунту?","forgot_password":"Забули пароль?","login":"Логін","sign_up":"Реєстрація"}}},"unlocks":{"send_instructions":"Протягом декількох хвилин Ви отримаєте лист з інструкціями по розблокуванню Вашого облікового запису.","send_paranoid_instructions":"Якщо Ваш обліковий запис існує, то протягом декількох хвилин Ви отримаєте лист з інструкціями по його розблокуванню.","unlocked":"Ваш обліковий запис розблоковано. Ви увійшли в систему."}},"errors":{"messages":{"already_confirmed":"вже підтверждено. Будь-ласка, спробуйте увійти в систему","blank_answer":"не може бути пустою","blank_question":"не може бути пустим","confirmation_period_expired":"має бути підтверджено протягом %{period}, будь-ласка, запросіть підтвердження запису завтра","expired":"застаріла. Будь-ласка, запросіть нову","not_found":"не знайдено","not_locked":"не заблоковано","not_saved":{"few":"%{resource}: не вдалося зберегти через %{count} помилок","many":"%{resource}: не вдалося зберегти через %{count} помилок","one":"Через одну помилку неможливо зберегти %{resource}:","other":"Через помилки неможливо зберегти %{resource}:"}}},"js":{"welcome":{"index":{"you_really_want":"Якщо ви закриєте або перезагрузите сторінку, то здача тесту завершиться і будуть враховані лише ті питання на які ви дали відповідь"}}},"layouts":{"header":{"buttons":{"add_news":"Додати новину","admin_main_page":"Адмінка","comments":"Додати пропозицію","edit":"Редагувати вчителів","edit_profile":"Редагувати профіль","language":"Змінити мову","log_in":"Логін","main":"Головна","manage_students":"Редагувати учнів","new_test":"Новий тест","news_list":"Список новин ","pass_test":"Пройти тест","register":"Зареєструватися","sign_out":"Вийти","teachers":"Вчителі","test_results":"Результати тестів","testing":"Список тестів","wath_comments":"Розглянути пропозиції"},"h_main_header":"школа №"}},"students":{"test_settings":{"index":{"buttons":{"back":"Назад","choose_subject":"Виберіть предмет","leave_page":"Перезавантажити сторінку","stay_here":"Не перезавантажувати"},"choose_subject":"Предмет","choose_theme":"Виберіть тему","h_testing":"Тестування","h_tests":"Тести","you_really_want":"Якщо ви закриєте або перезавантажите сторінку, то здача тесту завершиться і будуть враховані лише ті питання, на які ви дали відповідь."},"new":{"buttons":{"back":"Назад"},"h_testing":"Тестування"},"show":{"buttons":{"back":"Назад","pass_test":"Пройти тест"},"h_files":"Файли","h_testing":"Тестування","h_videos":"Відео","seconds":"секунд","testing_description":"Короткий опис: ","testing_max_tried_count":"Загальна кількість спроб: ","testing_theme":"Тест на тему: ","testing_time_to_pass":"Час проходження: ","the_end":"Ви не можете пройти даний тест тому, що використали усі спроби","you_have_attempting":"У вас залишилось спроб: "},"test_settings":{"buttons":{"show_test":" - пройти тест"}},"there_is_not_test":{"h_this_theme_doesnt_have_tests":"На цю тему, поки що, немає тестів"}},"tests":{"create":{"controllers":{"successfull":"Ви пройшли тест"}},"form":{"buttons":{"save":"Зберегти тест"}},"new":{"attention":"Увага! Ви можете дати лише одну відповідь на запитання. Якщо Ви дасте більше одної відповіді на одне запитання, то всі відповіді на дане запитання автоматично буть вважатися неправильними.","buttons":{"back":"Назад"},"h_testing":"Тестування","test_name":"Тест на тему: ","you_have_time":"Залишилось часу:"},"show":{"buttons":{"page_for_choose_tests":"Усі тести"},"h_test_results":"Результати тесту","result":"Результат: ","testing_max_tried_count":"Загальна кількість спроб: ","you_have_attempting":"У вас залишилось спроб: ","you_pass_test":"Назва тесту: ","you_pass_test_from_theme":"Тест на тему: "}}},"teachers":{"test_settings":{"answer_setting_fields":{"answer":"Відповідь","buttons":{"remove":"Видалити"},"mark_if_right":"Позначте, якщо відповідь правильна"},"create":{"controllers":{"successfull":"Ви успішо створили тест"}},"destroy":{"controllers":{"error":"Ви не можете видалити цей тест"}},"edit":{"buttons":{"back":"Назад","show":"Подивитись на тест"},"h_test_editing":"Редагування тестів"},"form":{"buttons":{"add_question":"Додати запитання","save":"Зберегти тест"},"choose_files":"Виберіть файли","choose_video":"Виберіть відео","class":"Клас","description":"Пояснення","max_tried_count":"Кількість спроб","subject":"Предмет","theme":"Тема"},"index":{"buttons":{"back":"Назад"},"h_tests":"Список тестів"},"new":{"buttons":{"back":"Назад"},"h_test_creation":"Створення тестів"},"question_fields":{"buttons":{"add_answer":"Додати відповідь","remove":"Видалити"},"question":"Запитання"},"show":{"buttons":{"back":"Назад","edit":"Редагувати тест","show":"Деталі"},"h_testing":"Результати тесту","seconds":"секунд","testing_description":"Короткий опис: ","testing_max_tried_count":"Загальна кількість спроб: ","testing_theme":"Тест на тему: ","testing_time_to_pass":"Час проходження: "},"test_results":{"buttons":{"show":"Деталі"},"class":"Клас","result":"Результат кращого тесту, %","show":"Деталі","time":"Час проходження тесту","tries_number":"К-сть використаних спроб","user_name":"Прізвище Ім'я Побатькові учня"},"test_setting":{"buttons":{"destroy":"Видалити","edit":"Редагувати","show":"Переглянути"},"confirm_destroy":"Ви дійсно хочете видалити даний тест?","description":"Опис","destroy":"Видалити","edit":"Редагувати","name":"Назва","show":"Переглянути","subject":"Предмет","theme":"Тема"}},"users":{"show":{"buttons":{"back":"Назад"},"class":"Клас: ","h_passed_tests":"Результати тесту","number_of_try":"Номер спроби","result":"Результат","testing_max_tried_count":"Загальна кількість спроб: ","testing_theme":"Тест на тему: ","time":"Час","user_name":"Прізвище Ім'я Побатькові учня: "}}},"unauthorized":{"default":"Ви не маєте доступу до цієї сторінки."},"users":{"index":{"buttons":{"back":"Назад"},"h_teachers":"Наші вчителі"},"users":{"email":"Емейл","name":"Прізвище Ім'я Побатькові","photo":"Фото"}},"views":{"pagination":{"first":"\u003c\u003c","last":"\u003e\u003e","next":"\u003e","previous":"\u003c"}},"welcome":{"right_panel":{"h_search":"Пошук","placeholder_search":"Пошук новин","search":"Пошук","search_clear":"Очистити пошук"},"show":{"buttons":{"back":"Назад"}},"tidings":{"h_news":"Новини"}}});
I18n.translations["en"] = I18n.extend((I18n.translations["en"] || {}), {"activerecord":{"attributes":{"comment":{"name":"Заголовок","text":"Текст"},"questions/answer_settings":{"name":"Відповідь"},"test_setting":{"name":"Назва","time_to_pass":"Час виконання"},"test_setting/questions":{"text":"Запитання"},"tiding":{"text":"Текст","title":"Заголовок"},"user":{"categgory_id":"Клас","current_password":"Поточний пароль","email":"Емейл","full_name":"Прізвище Ім'я Побатькові","password":"Пароль","password_confirmation":"Підтвердження паролю","subject_id":"Предмет"}},"errors":{"models":{"comment":{"attributes":{"name":{"blank":"не може бути пустим"},"text":{"blank":"не може бути пустим"}}},"test_setting":{"attributes":{"name":{"blank":"не може бути пустою"},"text":{"blank":"не може бути пустим"},"time_to_pass":{"blank":"не може бути пустим"}}},"tiding":{"attributes":{"text":{"blank":"не може бути пустим"},"title":{"blank":"не може бути пустим","taken":"вже існує","too_short":"занадто короткий (мінімум три символи)"}}},"user":{"attributes":{"current_password":{"blank":"не може бути пустим","invalid":"неправильний"},"email":{"bad_email_format":"має бути такого формату: xxx@xxx.xxx","blank":"не може бути пустим","taken":"вже занятий"},"full_name":{"blank":"не може бути пустим","taken":"вже занятий","too_short":"занадто коротке (мінімум три символи)"},"password":{"blank":"не може бути пустим","confirmation":"Паролі не співпадають","too_short":"занадто короткий(мінімум %{count} символів)"},"password_confirmation":{"confirmation":"пароль не співпадає"}}}}},"models":{"question":"питання","test_setting":"тест","test_settings":"тести","tiding":"новина","tidings":"новини","user":"користувача","users":"користувачів"}},"admin":{"comments":{"comments":{"guest":"Гість"},"destroy":{"controllers":{"error":"Ви не можете видалити цю пропозицію."}},"index":{"buttons":{"back":"Назад"},"h_suggestions_list":"Список пропозицій"}},"students":{"destroy":{"controllers":{"error":"Ви не можете видалити цього учня."}},"edit":{"buttons":{"back":"Назад","submit":"Зберегти"},"h_edit":"Редагування учня"},"index":{"buttons":{"back":"Назад"},"email":"Емейл","h_students":"Учні","name":"Прізвище Ім'я Побатькові","photo":"Фото"},"students":{"class":"Клас","destroy":"Видалити","destroy_certain":"Ви впевнені, що хочете видалити даного учня?","edit":"Редагувати","email":"Емейл","name":"Прізвище Ім'я Побатькові"}},"tidings":{"destroy":{"controllers":{"error":"Ви не можете видалити цю новину."}},"edit":{"buttons":{"add_photo":"Додати фотографію","back":"Назад","submit":"Зберегти"},"choose_photos":"Виберіть фотографії","h_edit_new":"Редагування новини","mark_if_right":"Позначте, якщо новина головна"},"form":{"buttons":{"add_photo":"Додати фотографію","submit":"Зберегти"},"choose_photos":"Виберіть фотографії і поставте позначку біля тієї, яка має відображатися першою","mark_if_right":"Позначте, якщо новина головна"},"image_fields":{"buttons":{"remove":"Видалити"}},"index":{"buttons":{"back":"Назад"},"h_news_list":"Список новин"},"new":{"buttons":{"back":"Назад"},"h_news_creation":"Створення новини"},"show":{"buttons":{"back":"Назад"}},"tidings":{"buttons":{"destroy":"Назад","edit":"Назад"},"destroy":"Видалити","destroy_certain":"Ви впевнені, що хочете видалити дану новину?","edit":"Редагувати","name":"Назва","text":"Текст","time":"Час створеня"}},"users":{"edit":{"avatar":"Фото","buttons":{"back":"Назад","submit":"Зберегти"},"delete_avatar":"Видалити фото","h_edit":"Редагування вчителя"},"index":{"buttons":{"back":"Назад"},"controllers":{"error":"Ви не можете видалити цього вчителя."},"email":"Емейл","h_teachers":"Наші вчителі","name":"Прізвище Ім'я Побатькові","photo":"Фото"},"users":{"buttons":{"destroy":"Видалити","edit":"Редагувати"},"confirm_destroy":"Ви впевнені, що хочете видалити даного вчителя?","destroy":"Видалити","edit":"Редагувати","email":"Емейл","name":"Прізвище Ім'я Побатькові","photo":"Фото"}}},"comments":{"create":{"controllers":{"sucessful":"Ваша пропозиція успішно створена і буде розглянута найближчим часом."}},"form":{"buttons":{"submit":"Додати пропозицію"}},"new":{"buttons":{"back":"Назад"},"h_add_suggestions":"Створення пропозицій"}},"devise":{"confirmations":{"confirmed":"Ваш обліковий запис підтверджено. Ви увійшли в систему.","send_instructions":"Ви отримаєте лист з інструкціями по підтвердженню вашого облікового запису протягом декількох хвилин.","send_paranoid_instructions":"Якщо Ваша email адреса існує в нашій базі даних, то протягом декількох хвилин Ви отримаєте лист з інструкціями по підтвердженню Вашого облікового запису."},"failure":{"already_authenticated":"Ви вже увійшли в систему.","inactive":"Ваш обліковий запис ще не активований.","invalid":"Невірний email чи пароль.","invalid_token":"Невірний ключ аутентифікації.","locked":"Ваш обліковий запис заблоковано.","not_found_in_database":"Невірний email чи пароль.","timeout":"Час вашої сесії вичерпано. Будь-ласка, увійдіть в систему знову.","unauthenticated":"Вам необхідно увійти в систему чи зареєструватися.","unconfirmed":"Ви маєте підтвердити Ваш обліковий запис."},"mailer":{"confirmation_instructions":{"subject":"Інструкції з підтвердження облікового запису"},"reset_password_instructions":{"subject":"Інструкції з відновлення паролю"},"unlock_instructions":{"subject":"Інструкції з розблокування облікового запису"}},"omniauth_callbacks":{"failure":"Ви не можете увійти в систему з облікового запису %{kind}, так як \"%{reason}\".","success":"Вхід в систему з облікового запису %{kind} успішний."},"passwords":{"format":"Невірний формат - має складати мінімум 8 символів, у тому числі одну прописну букву, рядкову букву і цифру.","new":{"buttons":{"send_me":"Надіслати"},"h_forgot_password":"Забули пароль?","on_this_address":"На цю адресу ми надішлемо інструкції для відновлення паролю"},"no_token":"Ця сторінка доступна тільки при переході з email для скидання паролю. Якщо Ви перейшли по посиланню з листа, будь-ласка, переконайтесь, що Ви використовували повний URL.","send_instructions":"Протягом декількох хвилин Ви отримаєте лист з інструкціями по скиданню Вашого паролю.","send_paranoid_instructions":"Якщо Ваша email адреса існує в нашій базі даних, то протягом декількох хвилин Ви отримаєте лист з інструкціями по відновленню Вашого паролю.","updated":"Ваш пароль було змінено. Ви увійшли в систему.","updated_not_active":"Ваш пароль було змінено успішно."},"registrations":{"destroyed":"До побачення! Ваш обліковий запис був успішно видалений. Сподіваємось незабаром побачитись з Вами знову.","edit":{"are_you_sure":"Ви впевнені?","avatar":"Фото","buttons":{"back":"Назад","cancel_account":"Відмінити мій акаунт","student":"Учень","submit":"Зберегти зміни","teacher":"Вчитель"},"choose_avatar":"Вибрати фото","h_cancel_account":"Відмінити мій акаунт","h_edit":"Редагування профілю","leave_blank":"(Залиште пустим якщо не хочете змінювати)","unhappy":"Незадоволені?","we_need_password":"(нам потрібен ваш поточний пароль для підтвердження ваших змін)"},"new":{"buttons":{"back":"Назад","student":"Учень","submit":"Реєстрація","teacher":"Вчитель"},"choose_avatar":"Виберіть фото","h_registration":"Реєстрація","min_password_length":"мінімум 8 символів"},"signed_up":"Ласкаво просимо! Ви успішно зареєструвалися.","signed_up_but_inactive":"Ви успішно зареєструвалися, але Ви не можете увійти в систему тому, що Ваш обліковий запис ще не активований.","signed_up_but_locked":"Ви успішно зареєструвалися, але Ви не можете увійти в систему тому, що Ваш обліковий запис заблоковано.","signed_up_but_unconfirmed":"Ви отримаєте лист з інструкціями по підтвердженню вашого облікового запису протягом декількох хвилин.","update_needs_confirmation":"Ваш обліковий запис оновлено успішно, але необхідно підтвердити Вашу нову email адресу. Будь-ласка, перевірте свою електронну скриньку і перейдіть за посиланням \"Підтвердити\", шоб завершити оновлення email адреси.","updated":"Ваш обліковий запис змінено."},"sessions":{"new":{"buttons":{"submit":"Авторизація"},"h_log_in":"Авторизація","remember":"Запам'ятати мене"},"signed_in":"Ви увійшли в систему.","signed_out":"Ви вийшли з системи."},"shared":{"links":{"buttons":{"come_from":"Зайти із#{provider.to_s.titleize}","dont_resive_instructions":"Не отримали інструкції для підтвердження акаунту?","dont_resive_instructions_to_unbloc":"Не отримали інструкції для розблокуванння акаунту?","forgot_password":"Забули пароль?","login":"Логін","sign_up":"Реєстрація"}}},"unlocks":{"send_instructions":"Протягом декількох хвилин Ви отримаєте лист з інструкціями по розблокуванню Вашого облікового запису.","send_paranoid_instructions":"Якщо Ваш обліковий запис існує, то протягом декількох хвилин Ви отримаєте лист з інструкціями по його розблокуванню.","unlocked":"Ваш обліковий запис розблоковано. Ви увійшли в систему."}},"errors":{"messages":{"already_confirmed":"вже підтверждено. Будь-ласка, спробуйте увійти в систему","blank_answer":"не може бути пустою","blank_question":"не може бути пустим","confirmation_period_expired":"має бути підтверджено протягом %{period}, будь-ласка, запросіть підтвердження запису завтра","expired":"застаріла. Будь-ласка, запросіть нову","not_found":"не знайдено","not_locked":"не заблоковано","not_saved":{"few":"%{resource}: не вдалося зберегти через %{count} помилок","many":"%{resource}: не вдалося зберегти через %{count} помилок","one":"Через одну помилку неможливо зберегти %{resource}:","other":"Через помилки неможливо зберегти %{resource}:"}}},"js":{"welcome":{"index":{"you_really_want":"Якщо ви закриєте або перезагрузите сторінку, то здача тесту завершиться і будуть враховані лише ті питання на які ви дали відповідь"}}},"layouts":{"header":{"buttons":{"add_news":"Додати новину","admin_main_page":"Адмінка","comments":"Додати пропозицію","edit":"Редагувати вчителів","edit_profile":"Редагувати профіль","language":"Змінити мову","log_in":"Логін","main":"Головна","manage_students":"Редагувати учнів","new_test":"Новий тест","news_list":"Список новин ","pass_test":"Пройти тест","register":"Зареєструватися","sign_out":"Вийти","teachers":"Вчителі","test_results":"Результати тестів","testing":"Список тестів","wath_comments":"Розглянути пропозиції"},"h_main_header":"школа №"}},"students":{"test_settings":{"index":{"buttons":{"back":"Назад","choose_subject":"Виберіть предмет","leave_page":"Перезавантажити сторінку","stay_here":"Не перезавантажувати"},"choose_subject":"Предмет","choose_theme":"Виберіть тему","h_testing":"Тестування","h_tests":"Тести","you_really_want":"Якщо ви закриєте або перезавантажите сторінку, то здача тесту завершиться і будуть враховані лише ті питання, на які ви дали відповідь."},"new":{"buttons":{"back":"Назад"},"h_testing":"Тестування"},"show":{"buttons":{"back":"Назад","pass_test":"Пройти тест"},"h_files":"Файли","h_testing":"Тестування","h_videos":"Відео","seconds":"секунд","testing_description":"Короткий опис: ","testing_max_tried_count":"Загальна кількість спроб: ","testing_theme":"Тест на тему: ","testing_time_to_pass":"Час проходження: ","the_end":"Ви не можете пройти даний тест тому, що використали усі спроби","you_have_attempting":"У вас залишилось спроб: "},"test_settings":{"buttons":{"show_test":" - пройти тест"}},"there_is_not_test":{"h_this_theme_doesnt_have_tests":"На цю тему, поки що, немає тестів"}},"tests":{"create":{"controllers":{"successfull":"Ви пройшли тест"}},"form":{"buttons":{"save":"Зберегти тест"}},"new":{"attention":"Увага! Ви можете дати лише одну відповідь на запитання. Якщо Ви дасте більше одної відповіді на одне запитання, то всі відповіді на дане запитання автоматично буть вважатися неправильними.","buttons":{"back":"Назад"},"h_testing":"Тестування","test_name":"Тест на тему: ","you_have_time":"Залишилось часу:"},"show":{"buttons":{"page_for_choose_tests":"Усі тести"},"h_test_results":"Результати тесту","result":"Результат: ","testing_max_tried_count":"Загальна кількість спроб: ","you_have_attempting":"У вас залишилось спроб: ","you_pass_test":"Назва тесту: ","you_pass_test_from_theme":"Тест на тему: "}}},"teachers":{"test_settings":{"answer_setting_fields":{"answer":"Відповідь","buttons":{"remove":"Видалити"},"mark_if_right":"Позначте, якщо відповідь правильна"},"create":{"controllers":{"successfull":"Ви успішо створили тест"}},"destroy":{"controllers":{"error":"Ви не можете видалити цей тест"}},"edit":{"buttons":{"back":"Назад","show":"Подивитись на тест"},"h_test_editing":"Редагування тестів"},"form":{"buttons":{"add_question":"Додати запитання","save":"Зберегти тест"},"choose_files":"Виберіть файли","choose_video":"Виберіть відео","class":"Клас","description":"Пояснення","max_tried_count":"Кількість спроб","subject":"Предмет","theme":"Тема"},"index":{"buttons":{"back":"Назад"},"h_tests":"Список тестів"},"new":{"buttons":{"back":"Назад"},"h_test_creation":"Створення тестів"},"question_fields":{"buttons":{"add_answer":"Додати відповідь","remove":"Видалити"},"question":"Запитання"},"show":{"buttons":{"back":"Назад","edit":"Редагувати тест","show":"Деталі"},"h_testing":"Результати тесту","seconds":"секунд","testing_description":"Короткий опис: ","testing_max_tried_count":"Загальна кількість спроб: ","testing_theme":"Тест на тему: ","testing_time_to_pass":"Час проходження: "},"test_results":{"buttons":{"show":"Деталі"},"class":"Клас","result":"Результат кращого тесту, %","show":"Деталі","time":"Час проходження тесту","tries_number":"К-сть використаних спроб","user_name":"Прізвище Ім'я Побатькові учня"},"test_setting":{"buttons":{"destroy":"Видалити","edit":"Редагувати","show":"Переглянути"},"confirm_destroy":"Ви дійсно хочете видалити даний тест?","description":"Опис","destroy":"Видалити","edit":"Редагувати","name":"Назва","show":"Переглянути","subject":"Предмет","theme":"Тема"}},"users":{"show":{"buttons":{"back":"Назад"},"class":"Клас: ","h_passed_tests":"Результати тесту","number_of_try":"Номер спроби","result":"Результат","testing_max_tried_count":"Загальна кількість спроб: ","testing_theme":"Тест на тему: ","time":"Час","user_name":"Прізвище Ім'я Побатькові учня: "}}},"unauthorized":{"default":"Ви не маєте доступу до цієї сторінки."},"users":{"index":{"buttons":{"back":"Назад"},"h_teachers":"Наші вчителі"},"users":{"email":"Емейл","name":"Прізвище Ім'я Побатькові","photo":"Фото"}},"views":{"pagination":{"first":"\u003c\u003c","last":"\u003e\u003e","next":"\u003e","previous":"\u003c"}},"welcome":{"right_panel":{"h_search":"Пошук","placeholder_search":"Пошук новин","search":"Пошук","search_clear":"Очистити пошук"},"show":{"buttons":{"back":"Назад"}},"tidings":{"h_news":"Новини"}}});
