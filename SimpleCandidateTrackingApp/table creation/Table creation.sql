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
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1$$

delimiter $$

CREATE TABLE `commdetails` (
  `iddetailed` int(11) NOT NULL AUTO_INCREMENT,
  `submittedby` varchar(50) DEFAULT NULL COMMENT 'Vendor name who is taking application on behalf of endclient.',
  `candidateid` varchar(60) DEFAULT NULL,
  `interactiontime` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `description` varchar(200) DEFAULT NULL COMMENT 'need of documenting the details of conversation, communication.',
  `attachment` blob,
  `groupid` tinyint(4) DEFAULT '0' COMMENT 'usergroupid is to make records available only to required user group(s). e.g. user can be marketing agent, candidate itself.\nSupergroupid is for further extentions.',
  `supergroupid` tinyint(4) DEFAULT '0',
  `issoftdeleted` bit(1) DEFAULT b'0',
  `endclient` varchar(50) DEFAULT NULL COMMENT 'to ensure we are following to the end of line. and wanted to know how many application have been submitted for the same endclient.',
  `currentstatus` varchar(45) DEFAULT NULL COMMENT 'status may be: Initial inquiry, application submitted, interview scheduled, awaiting final outcome, rejected, pending, deferred, followup, document\nrequested, need more clarification.',
  PRIMARY KEY (`iddetailed`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='capture candidate comm details'$$

delimiter $$

CREATE TABLE `submission` (
  `idsubmission` int(11) NOT NULL AUTO_INCREMENT,
  `client` varchar(100) NOT NULL,
  `address1` varchar(100) DEFAULT NULL,
  `address2` varchar(45) DEFAULT NULL,
  `city` varchar(45) DEFAULT NULL,
  `state` varchar(45) DEFAULT NULL,
  `zip` varchar(12) DEFAULT NULL,
  `candidateid` varchar(45) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `email_id` varchar(60) DEFAULT NULL,
  `website` varchar(45) DEFAULT NULL,
  `contactname` varchar(45) DEFAULT NULL,
  `groupid` tinyint(4) DEFAULT '0',
  `supergroupid` tinyint(4) DEFAULT '0',
  `issoftdeleted` bit(1) DEFAULT b'0' COMMENT 'this is to make that record not readable in UI,',
  `commdatestamp` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`idsubmission`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1 COMMENT='This table captuters the communication with clients.	\n		'$$

