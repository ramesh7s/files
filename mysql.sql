MySQL allows the following regular expression metacharacters:
SELECT * FROM reviews WHERE description REGEXP '[[:<:]]excellent[[:>:]]'
REGEXP '[[:<:]]$search_key'
. match any character ? match zero or one
* match zero or more
+ match one or more
{n} match n times
{m,n} match m through n times
{n,} match n or more times
^ beginning of line
$ end of line
[[:<:]] match beginning of words
[[:>:]] match ending of words
[:class:] match a character class
i.e., [:alpha:] for letters
[:space:] for whitespace
[:punct:] for punctuation
[:upper:] for upper case letters
[abc] match one of enclosed chars
[^xyz] match any char not enclosed
| separates alternatives
select on a name in comma separated values in PHP
$selection = 1;
SELECT * FROM `kayalstore_ads` WHERE CONCAT( ',', `ad_city_ids` , ',' ) LIKE '%1%'
or
SELECT * FROM `kayalstore_ads` WHERE FIND_IN_SET( "1", `ad_city_ids` ) 

Create comma separated values from using group by
SELECT GROUP_CONCAT( product ) FROM tbl_shop GROUP BY seller_id
Select Multiple value IN talble
SELECT `ProductDetail`.`id` , `ProductDetail`.`product_id` , `ProductDetail`.`product_max_price` , `ProductDetail`.`product_weight` ,`ProductDetail`.`product_weight_cat` , `ProductDetail`.`created` FROM `kayalstore`.`kayalstore_product_details` AS `ProductDetail` WHERE `product_id` =1 AND `ProductDetail`.`id` NOT IN ( 1, 8 ) 

Cakephp IN 
$product_type = $this->ProductType->find("all",array("fields" => array("id","product_type_name"),"conditions" => array("ProductType.status" => "A","ProductType.id IN ($product_type_ids)")));


Cake category with join
$joins1 = array(
	 'table' => 'categories',	
      'alias' => 'ParentCategory',
      'type' => 'LEFT',
      'foreignKey' => false,
      'conditions'=> array('Category.parent_id = ParentCategory.id')
);
$categories = $this->Category->find('all',
array('fields' => array(               'Category.id','Category.name','Category.status','Category.parent_id','ParentCategory.name','ParentCategory.parent_id'), 
'joins' => array($joins1)));

SELECT SQL_CALC_FOUND_ROWS category.category_name cName, pCat.category_name pCatName, category.status, category.id FROM `category` LEFT JOIN category pCat ON category.parent_id = pCat.id ORDER BY cName ASC 
LIMIT 0 , 10
Cakephp greater than system time
$current_time = date('Y-m-d H:i:s');
$ngo_events = $this->NgoEvent->find('all',array('fields' => array('slug','event_start_date','event_title'),'conditions' => array('status'=> 'A', 'event_start_date >= ' => date($current_time)),'order' => 'event_start_date asc'));
        
$this->set('ngo_events',$ngo_events);

Comma separator
$sql = "SELECT   $reports, GROUP_CONCAT(".DB_PREFIX."subjects.subject_name SEPARATOR ', ') FROM ".DB_PREFIX."teachers  LEFT JOIN ".DB_PREFIX."handling_subjects ON ".DB_PREFIX."teachers.id = ".DB_PREFIX."handling_subjects.teacher_id LEFT JOIN ".DB_PREFIX."subjects ON ".DB_PREFIX."handling_subjects.subject_id = ".DB_PREFIX."subjects.id LEFT JOIN ".DB_PREFIX."states as current ON current.id = ".DB_PREFIX."teachers.current_state LEFT JOIN ".DB_PREFIX."states as permanent ON permanent.id = ".DB_PREFIX."teachers.permanent_state $src GROUP BY ".DB_PREFIX."handling_subjects.teacher_id ";
SELECT `franchises`.`id` , `franchises`.`franchise_name` , `franchises`.`contact_person_name` , GROUP_CONCAT( `cities`.`city_name` ) AS`city_name` 
FROM `franchises` 
INNER JOIN `cities` ON FIND_IN_SET( `cities`.`id` , `franchises`.`location_preferred` ) 
GROUP BY `franchises`.`id` 
SELECT `monitoring`.`id` moid, school_id, school_code, tab_id, tab_ids 
FROM monitoring INNER JOIN schools ON FIND_IN_SET( monitoring.tab_id, schools.tab_ids ) 
GROUP BY monitoring.id
$cities_joins = array(
 	"table" => "cities",
  	"alias" => "City",
  	"type" => "INNER",
 	"foreignKey" => false,
 	"conditions" =>          array("FIND_IN_SET(City.id,Franchise.location_preferred)")
);
$franchises = $this->Franchise->find('all',array(
 	'fields' => array('Franchise.id','Franchise.franchise_name','Franchise.location_preferred','Franchise.contact_person_name','Franchise.contact_person_number','Franchise.contact_person_email_id','Franchise.status','GROUP_CONCAT( City.city_name SEPARATOR ", " ) AS city_name'),
 	'joins' => array($cities_joins),
 	'group' => array('Franchise.id')
));

SQL BETWEEN Query 
SELECT * FROM tbl_notification WHERE not_date BETWEEN '2014-07-25 16:26:36'
AND '2014-07-25 17:23:21' - (datetime)
SELECT * FROM tbl_notification WHERE DATE(not_date) BETWEEN DATE('2014-07-25') AND DATE('2014-07-26') - (date)
SELECT * FROM tbl_notification WHERE DATE(not_date) BETWEEN '2014-07-25' AND '2014-07-26' - (date)
Cake php Between date
$book_date_start = date("Y-m-d",strtotime($systime));
$book_date_end = date("Y-m-d", strtotime("+4 days"));
$conditions = array('Film.publish_date BETWEEN ? and ?' => array($book_date_start, $book_date_end));
$booking_opening = $this->Film->find('all', array(
     'joins' => array(array('table' => 'events','alias' => 'Event',
         'type' => 'LEFT','conditions' => array('Film.id = Event.film_id','Event.show_end_time >=' => $current_date))),
       'fields' => array('Film.id','Film.title','Film.image','Film.slug','Film.publish_date','MIN(Event.price) as event_price'),  
       'conditions' => array('Film.status' => 'A', $conditions),
       'group' => array('Film.id')));
Cakephp greater than and lessthan
$book_date = date("Y-m-d",strtotime($systime));
  $conditions = array('Film.publish_date <=' => $book_date, 'Film.expire_date >=' => $book_date);
  $now_showing = $this->Film->find('all', array(
    	'joins' => array(
       	array(
            	'table' => 'events',
                  'alias' => 'Event',
                  'type' => 'LEFT',
                  'conditions' => array('Film.id = Event.film_id','Event.show_end_time >=' => $current_date))),
      'fields' => array('Film.id','Film.title','Film.image','Film.slug','Film.publish_date','MIN(Event.price) as event_price'), 
      'conditions' => array('Film.status' => 'A', $conditions),
      'group' => array('Film.id') ));
SELECT * FROM milestone WHERE start_date <= '2016-07-19' AND end_date >= '2016-07-19' LIMIT 0 , 30
SELECT SQL_CALC_FOUND_ROWS id, Transaction_ID, name, DATE, TIME, pickup_city, going_city FROM bookings WHERE DATE >= CURDATE( ) 
ORDER BY DATE ASC , TIME ASC 
SELECT SQL_CALC_FOUND_ROWS id, Transaction_ID, name, DATE, TIME, pickup_city, going_city FROM bookings WHERE DATE( DATE ) >= DATE( NOW( ) ) 
ORDER BY DATE ASC , TIME ASC 
SELECT SQL_CALC_FOUND_ROWS id, Transaction_ID, name, DATE, TIME, pickup_city, going_city FROM bookings WHERE DATE( DATE ) >= '2018-03-19'
ORDER BY DATE ASC , TIME ASC 
SELECT SQL_CALC_FOUND_ROWS id, Transaction_ID, name, DATE, TIME, pickup_city, going_city, CONCAT( DATE, ' ', TIME ) AS DATETIME FROM bookings HAVING DATETIME >= NOW( ) ORDER BY DATE ASC , TIME ASC
OR condition
$user_exists_count = $this->User->find('count',array('conditions' => array('OR' => array('email_id' => $email_id,'mobile_no' => $mobile_no))));
 //$user_exists_count = $this->User->find('count',array('conditions' => array('OR' => array(array('email_id' => $email_id),array('mobile_no' => $mobile_no)))));

Alter Query:
ALTER TABLE `property_images` ADD `set_front_image` ENUM( 'Y', 'N' ) NOT NULL DEFAULT 'N' AFTER `image_name` ;
CAKEPHP GET VALUE WHEN COMMA SEPRATOR:
 
$cities_joins = array(
 	"table" => "cities",
 	"alias" => "City",
 	"type" => "INNER",
      "foreignKey" => false, 
      "conditions" => array("FIND_IN_SET( City.id , DirectoryList.location)")
); 
$parent_category = array(
 	'table' => 'directory_categories',
 	'alias' => 'DirectoryCategory',
	'type' => 'INNER',
      'foreignKey' => false,
 	'conditions'=> array("FIND_IN_SET(DirectoryCategory.id , 
 					DirectoryList.directory_category_id )")
);
$user_lists = $this->DirectoryList->find('all',array(
 	'fields' => array('DirectoryList.contact_person_name', 'GROUP_CONCAT( DISTINCT DirectoryCategory.name  ) AS dir_name','GROUP_CONCAT( DISTINCT City.city_name ) AS city_name', 'DirectoryList.location, 'DirectoryList.directory_category_id'), 
 	'joins' => array($parent_category,$cities_joins),
 	'conditions' => array('DirectoryCategory.parent_id' => $id),
 	'group' => array('DirectoryList.id')
));
$this->set('user_lists',$user_lists);
OTHER EXE
$test_subject_join = array(
         	"table" => "test_subjects",
         	"alias" => "TestSubject",
         	"type" => "LEFT",
            	"foreignKey" => false, 
            	"conditions" => array("FIND_IN_SET( Test.id , TestSubject.test_id)")
        ); 
        $level_join = array(
			'table' => 'levels',
			'alias' => 'Level',
			'type' => 'LEFT',
          	 		 'foreignKey' => false,
			'conditions'=> array('Level.id = Test.level_id')
		);
        $test_join = array(
			'table' => 'tests',
			'alias' => 'Test',
			'type' => 'LEFT',
            			'foreignKey' => false,
			'conditions'=> array('Test.group_id = Group.id','Test.status' => 'A')
	);   
$groups_lists = $this->Group->find('all',array(
            'fields' => array('Group.id','Group.group_name','Group.group_desp','Group.group_image',      'Group.follow_count',  'Group.total_test','Group.share','Test.id','Test.test_desp', 
'Test.total_questions', 'Test.answerable','Test.marks','Test.total_marks','Test.time_limit', 'Test.duration', 'GROUP_CONCAT(DISTINCT TestSubject.subject_id SEPARATOR ", ") AS subject_name', 'Level.level_name'), 
            'conditions' => array('Group.id' => $groupId),
            'joins' => array($test_join, $level_join, $test_subject_join),
            'group' => array('Test.id')
        ));
SELECT `DirectoryList`.`contact_person_name` , `DirectoryList`.`directory_category_id` , `DirectoryList`.`location` , GROUP_CONCAT(DISTINCT DirectoryCategory.name ) AS dir_name, GROUP_CONCAT( DISTINCT City.city_name ) AS city_name
FROM `bhagula`.`directory_lists` AS `DirectoryList` 
INNER JOIN `bhagula`.`directory_categories` AS `DirectoryCategory` ON ( FIND_IN_SET( `DirectoryCategory`.`id` ,`DirectoryList`.`directory_category_id` ) ) INNER JOIN `bhagula`.`cities` AS `City` ON ( FIND_IN_SET( `City`.`id` , `DirectoryList`.`location` ) ) WHERE `DirectoryCategory`.`parent_id` = '1' GROUP BY `DirectoryList`.`id`
OUTPUT:
 
CAKEPHP GET COUNT FOR PARTICULAR NAME DURING COMMA SEPRATOR:
$cities_joins = array(
 	"table" => "cities",
      "alias" => "City",
      "type" => "INNER",
 	"foreignKey" => false,
 	"conditions" => array("FIND_IN_SET( City.id , DirectoryList.location)")
);
$user_lists = $this->DirectoryList->find('all',array(
 	'fields' => array('COUNT(DirectoryList.location) AS     location_count','GROUP_CONCAT( DISTINCT City.city_name ) AS city_name'),
 	'joins' => array($cities_joins),
 	'conditions' => array("FIND_IN_SET( '$dir_id', DirectoryList.directory_category_id)","DirectoryList.status" => "A"),
 	'group' => array('City.city_name'),
 	'order' => array('City.city_name ASC')
));
SELECT COUNT( `DirectoryList`.`location` ) , GROUP_CONCAT( DISTINCT City.city_name ) AS city_name FROM `bhagula`.`directory_lists` AS `DirectoryList` 
INNER JOIN `bhagula`.`cities` AS `City` ON ( FIND_IN_SET( `City`.`id` , `DirectoryList`.`location` ) ) WHERE FIND_IN_SET( '8', directory_category_id ) 
AND `DirectoryList`.`status` = 'A' GROUP BY `City`.`city_name`

OUTPUT:
  
Cakephp like query:
$user_lists = $this->User->find('all',array('conditions' => array('status' => 'A', 'first_name Like' => '%'.$terms.'%')));
Date Count:
SELECT COUNT( * ) AS `count` FROM `kayalstore`.`kayalstore_purchase_orders` 
AS `PurchaseOrder` WHERE DATE( `created` ) = '2014-03-04'
$count_pur_ord_cur_date = $this->PurchaseOrder->find('count',array('conditions' => array('DATE(created)' => $cur_date)));
Count base on status:
SELECT S.message_id, S.router_id, S.group_id, S.message_send_timing, G.category_name, S.mail_message, S.mail_status, COUNT( * ) AS countVal, SUM( S.mail_status = 'S' ) AS SuccessCount, SUM( S.mail_status = 'F' ) AS FailCount, SUM( S.msg_read_status = 'R' ) AS ReadCount,R.router_name, R.user_name
FROM `send_mail_informations` AS S LEFT JOIN routers AS R ON R.id = S.router_id LEFT JOIN categories AS G ON G.id = S.group_id
GROUP BY message_id, router_id, group_id


COUNT MULTIPLE TABLE: 
select t.Topic, t.Title, count(distinct s.starID) as StarCount, count(distinct m.User) as UserCount, count(distinct m.messageID) as MessageCount from Topics t left join Messages m ON m.Topic = t.Topic
left join Stars_Given s ON s.Topic = t.Topic group by t.Topic, t.Title

OR
select t.Topic, t.Title, s.StarCount, m.UserCount, m.MessageCount from  Topics t left join (select Topic, count(distinct User) as UserCount,      count(*) as MessageCount from Messages group by Topic) m ON m.Topic = t.Topic
left join (select Topic, count(*) as StarCount from Stars_Given group by Topic ) s ON s.Topic = t.Topic


Sum of timing
SELECT SEC_TO_TIME( SUM( TIME_TO_SEC( timing ) ) ) AS timeSum FROM `ismoufe_user_answers` GROUP BY result_id
Comma separator base on status grouping same

SELECT GROUP_CONCAT( sno ) AS sno, STATUS FROM user_test_details WHERE user_test_id = 2 GROUP BY STATUS LIMIT 0 , 30
     
Previous:
SELECT `UserTestDetail`.`id` , `UserTestDetail`.`user_test_id` , `UserTestDetail`.`question_id` , `UserTestDetail`.`sno` ,`UserTestDetail`.`correct_opt_id` , `UserTestDetail`.`select_opt_id` , `UserTestDetail`.`status` , `UserTestDetail`.`answer` ,`UserTestDetail`.`book_mark_status` , `UserTestDetail`.`mark` , `UserTestDetail`.`time_taken` , `UserTestDetail`.`created` ,`UserTestDetail`.`modified` FROM `onlinetest`.`user_test_details` AS `UserTestDetail` 
WHERE `sno` < '3' AND `user_test_id` =67 ORDER BY `id` DESC LIMIT 1
Next: 
SELECT `UserTestDetail`.`id` , `UserTestDetail`.`user_test_id` , `UserTestDetail`.`question_id` , `UserTestDetail`.`sno` ,`UserTestDetail`.`correct_opt_id` , `UserTestDetail`.`select_opt_id` , `UserTestDetail`.`status` , `UserTestDetail`.`answer` ,`UserTestDetail`.`book_mark_status` , `UserTestDetail`.`mark` , `UserTestDetail`.`time_taken` , `UserTestDetail`.`created` ,`UserTestDetail`.`modified` FROM `onlinetest`.`user_test_details` AS `UserTestDetail` 
WHERE `sno` > '1' AND `user_test_id` =67 ORDER BY `id` ASC LIMIT 1
Count on each month:
SELECT DATE_FORMAT( created, '%Y' ) AS 'year', DATE_FORMAT( created, '%m' ) AS 'month', COUNT( id ) AS 'total' FROM jobs GROUP BY DATE_FORMAT( created, '%Y%m' ) LIMIT 0 , 30
Current month:
SELECT DATE_FORMAT( created, '%m' ) AS 'month', COUNT( id ) AS 'total' FROM  jobs WHERE YEAR( created ) = YEAR( NOW( ) ) AND MONTH( created ) = MONTH( NOW( ) )LIMIT 0 , 30
SELECT DATE_FORMAT( created, '%m' ) AS 'month', COUNT( id ) AS 'total' FROM  jobs WHERE YEAR( created ) = 2017 AND MONTH( created ) = 05 LIMIT 0 , 30
Current year:
SELECT DATE_FORMAT( created, '%Y' ) AS 'year', COUNT( id ) AS 'total'
FROM jobs WHERE YEAR( created ) = YEAR( NOW( ) ) LIMIT 0 , 30
This week or current week
SELECT WEEK( created ) AS `week` , COUNT( id ) AS 'total' FROM jobs WHERE YEARWEEK( created ) = YEARWEEK( NOW( ) ) LIMIT 0 , 30
Yesterday:
SELECT DATE_SUB( CURDATE( ) , INTERVAL 1 DAY ) AS yesteday, COUNT( id ) AS total FROM jobs WHERE DATE_SUB( CURDATE( ) , INTERVAL 1 DAY ) <= created
LIMIT 0 , 30
Today count:
SELECT CURRENT_DATE, COUNT( * ) AS visits_today FROM jobs WHERE created >= CURDATE( ) LIMIT 0 , 30
THIS MONTH
SELECT * FROM BookDetail WHERE MONTH(RecievedDate) = 07 AND YEAR(RecievedDate) = 2015

LAST 60 DAYS
SELECT * FROM `stage1` WHERE created BETWEEN CURDATE( ) - INTERVAL 60 
DAY AND CURDATE( ) 
LAST MONTH
SELECT * FROM users WHERE MONTH(registered) = (MONTH(NOW()) - 1) AND YEAR(registered) = YEAR(NOW())
DISTANCE CALCULATION (in Miles):
SELECT sub_cities . * , 3959*2 * ASIN( SQRT( POWER( SIN( (
'13.010133' - latitude
) * PI( ) /180 /2 ) , 2 ) + COS( '13.010133' * PI( ) /180 ) * COS( latitude * PI( ) /180 ) * POWER( SIN( (
'80.2112164' - longitude
) * PI( ) /180 /2 ) , 2 ) ) ) AS distance FROM sub_cities GROUP BY id HAVING distance <=5 ORDER BY distance ASC LIMIT 0 , 30; replace (3959 to 6371) for km
$center_lat = $_GET["lat"];
$center_lng = $_GET["lng"];
$radius = $_GET["radius"];
$query = sprintf("SELECT address, name, lat, lng, ( 3959 * acos( cos( radians('%s') ) * cos( radians( lat ) ) * cos( radians( lng ) - radians('%s') ) + sin( radians('%s') ) * sin( radians( lat ) ) ) ) AS distance FROM markers HAVING distance < '%s' ORDER BY distance LIMIT 0 , 20",
  mysql_real_escape_string($center_lat),
  mysql_real_escape_string($center_lng),
  mysql_real_escape_string($center_lat),
  mysql_real_escape_string($radius));
$result = mysql_query($query);
https://developers.google.com/maps/articles/phpsqlsearch_v3
DISTANCE CALCULATION (in KM): 
SELECT sub_cities . * , 111.1111 * DEGREES( ACOS( COS( RADIANS( '13.010133' ) ) * COS( RADIANS( latitude ) ) * COS( RADIANS('80.2112164' - longitude ) ) + SIN( RADIANS( '13.010133' ) ) * SIN( RADIANS( latitude ) ) ) ) AS distance_in_km FROM sub_cities GROUP BY id HAVING distance_in_km <=50 ORDER BY `distance_in_km` ASC LIMIT 0 , 30


CREATE VIEW: 
CREATE OR REPLACE VIEW dmycontact_conference AS SELECT `id` , CONCAT( YEAR( NOW( ) ) , "-", LPAD( StartMonth, 2, '00' ) , "-", LPAD( StartDay, 2, '00' ) ) AS newdate, `TherapyArea` , `Title` ,`City` , `Website` , `Earlyfee`, `Comments` FROM `conference` ORDER BY `newdate`
CREATE OR REPLACE VIEW `eo_time_difference` AS 
SELECT `eo_events`.`id` AS `id` , `eo_events`.`event_date` AS `event_date` , `eo_events`.`event_start_time` AS `event_start_time` , `eo_events`.`event_end_time` AS `event_end_time` , DATE_FORMAT(CONCAT( `eo_events`.`event_date` , ' ', `eo_events`.`event_start_time` ) , '%Y-%m-%d %H:%i:%S' ) AS `date_time` 
FROM `eo_events` 
WHERE (
`eo_events`.`event_date` <> '0000-00-00'
)

ADD YEAR INTERVAL USIN WHEN CASE: 
SELECT CASE WHEN CURDATE( ) > DATE( newdate ) THEN DATE( DATE_ADD( newdate, INTERVAL 1 YEAR ) ) ELSE DATE( newdate ) END AS newdate2, ID, Title FROM dmycontact_conference ORDER BY `newdate2` DESC 
UPDATE: 
UPDATE conference t1, conf_data t2 SET t1.Earlyfee = t2.Earlyfee, t1.Comments = t2.Comments WHERE t1.id = t2.id;
UPDATE `schools` INNER JOIN `upload_images` ON `upload_images`.school_code = `schools`.school_code SET `image_flag` = '1'

UPDATE `schools` INNER JOIN `upload_images` ON `upload_images`.school_code = `schools`.school_code SET `image_flag` = '1', image_upldate = `upload_images`.created
Retrieving the last record in each group

SELECT DISTINCT (grievance_id), doh, t1.status, t1.remark, road_number, 
complainant_name, larr_id, receipt_date, t2.id FROM ( SELECT * FROM grievance_tbl_remarks ORDER BY id DESC ) AS t1 INNER JOIN grievance_tbl t2 ON t2.id = t1.grievance_id GROUP BY grievance_id
ORDER BY t1.id DESC LIMIT 0 , 30

DELETE USING JOIN:

DELETE sustainableliving FROM sustainableliving INNER JOIN schools ON schools.school_code = sustainableliving.school_id WHERE schools.state = 'Auroville'

COUNT GREATER THAN 1:
SELECT GROUP_CONCAT( id ) , COUNT( * ) cnt, school_id FROM stage2 GROUP BY school_id HAVING cnt >1 ORDER BY cnt DESC

REMOVE PARTICULAR VALUE IN COMMA SEPERATOR:

UPDATE lco_street SET Access = TRIM( BOTH ',' FROM REPLACE( CONCAT( ',', Access, ',' ) , ',6,', ',' ) ) WHERE FIND_IN_SET( '6', Access )

UPDATE ONE VALUE BY ANOTHER:

UPDATE table SET field = REPLACE(field, 'string', 'anothervalue') WHERE field LIKE '%string%';

CREATE TRIGGER: 
DELIMITER $$
CREATE TRIGGER MyTrigger BEFORE  INSERT ON `tbl_franchise_welcomekit` 
FOR EACH
ROW BEGIN 
DECLARE invno BOOLEAN;

-- Check Franchise table
SELECT CONCAT_WS( '-', 'TRN', DATE_FORMAT( DATE, "%y%m%d" ) , LPAD( COUNT( id ) , 3, '0' ) ) 
INTO @invno 
FROM tbl_franchise_welcomekit
WHERE DATE_FORMAT( DATE, "%Y-%m" ) ;
SET NEW.invoice_no = ( @invno ) ;

END ;
$$
DELIMITER ;

WHEN THEN CASE:

SELECT `school_code` , `school_name` , `district` , `block` , `a.8` `Name of Headteacher/Principal` , `a.10` `Headteacher's/Principal's Mobile` , 
CASE WHEN `d.b.21` = '1' THEN 'Yes' WHEN `d.b.21` = '2' THEN 'No' WHEN `d.b.21` = '3' THEN 'Others' ELSE '' END AS `Is water available to wash hands in the toilets?` , `d.b.21.o` , CASE WHEN `d.b.22` = '1' THEN 'Handpumps' WHEN `d.b.22` = '2' THEN 'Tap water' WHEN `d.b.22` = '3'
THEN 'ONGC Provided' WHEN `d.b.22` = '4' THEN 'Well' WHEN `d.b.22` = '5'
THEN 'None' WHEN `d.b.22` = '6' THEN 'Other' ELSE '' END AS `If yes, what is the source of water for washing hands?` , `d.b.22.o` FROM `schools` LEFT JOIN `stage1` ON `school_code` = `school_id` WHERE state = 'Tripura' LIMIT 0 , 30

SUM COUNT TWO Table:
SUM(IF($jTable2.".DBCONSTANTS::col_pd_id." = '', 1, 0 )),'0')"

INSERT DATA FROM OTHER TABLE:

INSERT INTO `tbl_pins` ( `wk_id` , `unique_code` , `used_status` , `used_info` , `used_by` , `status` , `created` , `modified` ) 
SELECT `wk_id` , `unique_code` , `used_status` , `used_info` , `used_by` , `status` , `created` , `modified` 
FROM `tbl_franchise_welcomekit_info`
Move table form one db to another db
alter table my_old_db.mytable rename my_new_db.mytable

DATE TIME GREATER THAN:

SELECT * FROM statt_notification WHERE STR_TO_DATE( created, '%Y-%m-%d %H:%i:%s' ) >= '2018-05-17 16:14:53' ORDER BY created DESC 

SeTracking::select(['time','user_id','location','lat','long'])->whereRaw(DB::raw("DATE(created_at) = '".$createdAt."'"))
            ->where([
                'user_id' => $id,
                //'entry_type' => 'Tracking'
            ])
			->where("lat","<>",NULL)
			->where("long","<>",NULL)
			->groupBy(DB::raw("UNIX_TIMESTAMP(time) DIV 1800"))
			->get()->toArray();
