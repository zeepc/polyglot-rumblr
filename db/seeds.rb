
# User.create(first_name: "Test", last_name: "Lasttest", email: "test@test.com", username: "test123", password: "123123", birthday: "2010-03-10")


# Post.create(title:"Turkish Test Post", body:"Lorem ipsum dolor sit amet, eu propriae abhorreant sed. Te altera vivendum instructior eum. Ad usu illud aeque. An facer aeque gloriatur vim, ad liber aliquid accusamus nam. Ut pro audire legimus fastidii, sea in saepe prompta urbanitas. Vel mucius latine an, est velit instructior vituperatoribus at, at dicat referrentur per. Et his eius vocent. Qui an suas veniam, est labores copiosae deterruisset ei, pri no illud harum oportere. Ea duo nobis maiorum constituam, id suas option insolens sed, ut diam fastidii iudicabit mea. Postea impetus efficiantur cu vix. Cu sed alia delicatissimi, ex cum stet affert." ,date:"2018-04-22",user_id:1)
# Post.create(title:"Russian Test Post", body:"Лорем ипсум долор сит амет, яуи яуот алияуип цу, ин иллуд посидониум перципитур усу. Еррор риденс ехпетенда но при, не индоцтум тинцидунт еффициантур усу. Вим ин инструцтиор цомплецтитур. Но ребум солута хонестатис еум, вирис еверти адолесценс ад про. Ан неморе омиттантур яуи. Ет либрис демоцритум вим, вих миним аетерно еяуидем те, маиорум елояуентиам те при. Яуо глориатур интеллегебат еу. Не ест плацерат мнесарчум, цу хас фуиссет волумус интеллегат, пробо аппетере маиестатис сеа ат. Еам еи яуис хомеро путент, алии промпта вим ет. Нисл перципит еи яуо." ,date: "2018-04-25",user_id:1)


# Tag.create(tag_name:"turkish",tag_type:"language")
# Tag.create(tag_name:"grammar",tag_type:"language")
# Tag.create(tag_name:"russian",tag_type:"language")



PostTag.create(tag_id:1,post_id:1)
PostTag.create(tag_id:2,post_id:1)
PostTag.create(tag_id:3,post_id:2)
PostTag.create(tag_id:2,post_id:2)


Favorite.create(user_id:1,post_id:1)
Favorite.create(user_id:1,post_id:2)