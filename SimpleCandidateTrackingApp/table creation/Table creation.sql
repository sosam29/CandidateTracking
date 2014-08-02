delimiter $$

CREATE TABLE `submission` (
  `idsubmission` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(100) NOT NULL,
  `address1` varchar(45) NOT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `candidateid` varchar(45) DEFAULT NULL,
  `phone` varchar(12) DEFAULT NULL,
  `email_id` varchar(60) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `contactname` varchar(45) DEFAULT NULL,
  `groupid` tinyint(4) DEFAULT '0',
  `supergroupid` int(11) DEFAULT '0',
  `issoftdeleted` bit(1) DEFAULT NULL COMMENT 'this is to make that record not readable in UI,',
  `commdatestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idsubmission`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1 COMMENT='This table captuters the communication with clients.	\n		'$$

delimiter $$

CREATE TABLE `commdetails` (
  `iddetailed` int(11) NOT NULL AUTO_INCREMENT,
  `submissionid` int(11) DEFAULT NULL,
  `candidateid` varchar(60) NOT NULL,
  `interactiontime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) DEFAULT NULL,
  `attachment` blob,
  `groupid` tinyint(4) DEFAULT '0' COMMENT 'usergroupid is to make records available only to required user group(s). e.g. user can be marketing agent, candidate itself.\nSupergroupid is for further extentions.',
  `supergroupid` tinyint(4) DEFAULT NULL,
  `issoftdeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`iddetailed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='capture candidate comm details'$$

delimiter $$

CREATE TABLE `candidatedetails` (
  `email_id` varchar(30) NOT NULL,
  `name` varchar(50) NOT NULL,
  `address` varchar(80) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `candidateid` int(11) NOT NULL AUTO_INCREMENT,
  `groupid` tinyint(4) DEFAULT '0',
  `supergroupid` tinyint(4) DEFAULT '0',
  `issoftdeleted` bit(1) DEFAULT b'0',
  PRIMARY KEY (`candidateid`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1$$

