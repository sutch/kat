-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 22, 2019 at 01:24 PM
-- Server version: 10.3.13-MariaDB-1:10.3.13+maria~bionic
-- PHP Version: 7.2.17-0ubuntu0.18.04.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `keycloak`
--

-- --------------------------------------------------------

--
-- Table structure for table `ADMIN_EVENT_ENTITY`
--

CREATE TABLE `ADMIN_EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `ADMIN_EVENT_TIME` bigint(20) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `OPERATION_TYPE` varchar(255) DEFAULT NULL,
  `AUTH_REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_CLIENT_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `RESOURCE_PATH` varchar(2550) DEFAULT NULL,
  `REPRESENTATION` text DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `RESOURCE_TYPE` varchar(64) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ASSOCIATED_POLICY`
--

CREATE TABLE `ASSOCIATED_POLICY` (
  `POLICY_ID` varchar(36) NOT NULL,
  `ASSOCIATED_POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AUTHENTICATION_EXECUTION`
--

CREATE TABLE `AUTHENTICATION_EXECUTION` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `AUTHENTICATOR` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `REQUIREMENT` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `AUTHENTICATOR_FLOW` bit(1) NOT NULL DEFAULT b'0',
  `AUTH_FLOW_ID` varchar(36) DEFAULT NULL,
  `AUTH_CONFIG` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AUTHENTICATION_FLOW`
--

CREATE TABLE `AUTHENTICATION_FLOW` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) NOT NULL DEFAULT 'basic-flow',
  `TOP_LEVEL` bit(1) NOT NULL DEFAULT b'0',
  `BUILT_IN` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AUTHENTICATOR_CONFIG`
--

CREATE TABLE `AUTHENTICATOR_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `AUTHENTICATOR_CONFIG_ENTRY`
--

CREATE TABLE `AUTHENTICATOR_CONFIG_ENTRY` (
  `AUTHENTICATOR_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `BROKER_LINK`
--

CREATE TABLE `BROKER_LINK` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL,
  `BROKER_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT`
--

CREATE TABLE `CLIENT` (
  `ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FULL_SCOPE_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PUBLIC_CLIENT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` varchar(255) DEFAULT NULL,
  `BASE_URL` varchar(255) DEFAULT NULL,
  `BEARER_ONLY` bit(1) NOT NULL DEFAULT b'0',
  `MANAGEMENT_URL` varchar(255) DEFAULT NULL,
  `SURROGATE_AUTH_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL,
  `NODE_REREG_TIMEOUT` int(11) DEFAULT 0,
  `FRONTCHANNEL_LOGOUT` bit(1) NOT NULL DEFAULT b'0',
  `CONSENT_REQUIRED` bit(1) NOT NULL DEFAULT b'0',
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `SERVICE_ACCOUNTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `CLIENT_AUTHENTICATOR_TYPE` varchar(255) DEFAULT NULL,
  `ROOT_URL` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REGISTRATION_TOKEN` varchar(255) DEFAULT NULL,
  `STANDARD_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'1',
  `IMPLICIT_FLOW_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DIRECT_ACCESS_GRANTS_ENABLED` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_ATTRIBUTES`
--

CREATE TABLE `CLIENT_ATTRIBUTES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_AUTH_FLOW_BINDINGS`
--

CREATE TABLE `CLIENT_AUTH_FLOW_BINDINGS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `FLOW_ID` varchar(36) DEFAULT NULL,
  `BINDING_NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_DEFAULT_ROLES`
--

CREATE TABLE `CLIENT_DEFAULT_ROLES` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_INITIAL_ACCESS`
--

CREATE TABLE `CLIENT_INITIAL_ACCESS` (
  `ID` varchar(36) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `EXPIRATION` int(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `REMAINING_COUNT` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_NODE_REGISTRATIONS`
--

CREATE TABLE `CLIENT_NODE_REGISTRATIONS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` int(11) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SCOPE`
--

CREATE TABLE `CLIENT_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PROTOCOL` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SCOPE_ATTRIBUTES`
--

CREATE TABLE `CLIENT_SCOPE_ATTRIBUTES` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SCOPE_CLIENT`
--

CREATE TABLE `CLIENT_SCOPE_CLIENT` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SCOPE_ROLE_MAPPING`
--

CREATE TABLE `CLIENT_SCOPE_ROLE_MAPPING` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION`
--

CREATE TABLE `CLIENT_SESSION` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `REDIRECT_URI` varchar(255) DEFAULT NULL,
  `STATE` varchar(255) DEFAULT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `SESSION_ID` varchar(36) DEFAULT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `AUTH_USER_ID` varchar(36) DEFAULT NULL,
  `CURRENT_ACTION` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION_AUTH_STATUS`
--

CREATE TABLE `CLIENT_SESSION_AUTH_STATUS` (
  `AUTHENTICATOR` varchar(36) NOT NULL,
  `STATUS` int(11) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION_NOTE`
--

CREATE TABLE `CLIENT_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION_PROT_MAPPER`
--

CREATE TABLE `CLIENT_SESSION_PROT_MAPPER` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_SESSION_ROLE`
--

CREATE TABLE `CLIENT_SESSION_ROLE` (
  `ROLE_ID` varchar(255) NOT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CLIENT_USER_SESSION_NOTE`
--

CREATE TABLE `CLIENT_USER_SESSION_NOTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL,
  `CLIENT_SESSION` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `COMPONENT`
--

CREATE TABLE `COMPONENT` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `PARENT_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_TYPE` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `SUB_TYPE` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `COMPONENT_CONFIG`
--

CREATE TABLE `COMPONENT_CONFIG` (
  `ID` varchar(36) NOT NULL,
  `COMPONENT_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `COMPOSITE_ROLE`
--

CREATE TABLE `COMPOSITE_ROLE` (
  `COMPOSITE` varchar(36) NOT NULL,
  `CHILD_ROLE` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CREDENTIAL`
--

CREATE TABLE `CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(4000) DEFAULT NULL,
  `USER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT 0,
  `DIGITS` int(11) DEFAULT 6,
  `PERIOD` int(11) DEFAULT 30,
  `ALGORITHM` varchar(36)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `CREDENTIAL_ATTRIBUTE`
--

CREATE TABLE `CREDENTIAL_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOG`
--

CREATE TABLE `DATABASECHANGELOG` (
  `ID` varchar(255) NOT NULL,
  `AUTHOR` varchar(255) NOT NULL,
  `FILENAME` varchar(255) NOT NULL,
  `DATEEXECUTED` datetime NOT NULL,
  `ORDEREXECUTED` int(11) NOT NULL,
  `EXECTYPE` varchar(10) NOT NULL,
  `MD5SUM` varchar(35) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL,
  `COMMENTS` varchar(255) DEFAULT NULL,
  `TAG` varchar(255) DEFAULT NULL,
  `LIQUIBASE` varchar(20) DEFAULT NULL,
  `CONTEXTS` varchar(255) DEFAULT NULL,
  `LABELS` varchar(255) DEFAULT NULL,
  `DEPLOYMENT_ID` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DATABASECHANGELOGLOCK`
--

CREATE TABLE `DATABASECHANGELOGLOCK` (
  `ID` int(11) NOT NULL,
  `LOCKED` bit(1) NOT NULL,
  `LOCKGRANTED` datetime DEFAULT NULL,
  `LOCKEDBY` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `DEFAULT_CLIENT_SCOPE`
--

CREATE TABLE `DEFAULT_CLIENT_SCOPE` (
  `REALM_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL,
  `DEFAULT_SCOPE` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `EVENT_ENTITY`
--

CREATE TABLE `EVENT_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(255) DEFAULT NULL,
  `DETAILS_JSON` varchar(2550) DEFAULT NULL,
  `ERROR` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `SESSION_ID` varchar(255) DEFAULT NULL,
  `EVENT_TIME` bigint(20) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FEDERATED_IDENTITY`
--

CREATE TABLE `FEDERATED_IDENTITY` (
  `IDENTITY_PROVIDER` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `FEDERATED_USER_ID` varchar(255) DEFAULT NULL,
  `FEDERATED_USERNAME` varchar(255) DEFAULT NULL,
  `TOKEN` text DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FEDERATED_USER`
--

CREATE TABLE `FEDERATED_USER` (
  `ID` varchar(255) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_CREDENTIAL_ATTRIBUTE`
--

CREATE TABLE `FED_CREDENTIAL_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `CREDENTIAL_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(4000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_ATTRIBUTE`
--

CREATE TABLE `FED_USER_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `VALUE` varchar(2024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_CONSENT`
--

CREATE TABLE `FED_USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_CONSENT_CL_SCOPE`
--

CREATE TABLE `FED_USER_CONSENT_CL_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_CREDENTIAL`
--

CREATE TABLE `FED_USER_CREDENTIAL` (
  `ID` varchar(36) NOT NULL,
  `DEVICE` varchar(255) DEFAULT NULL,
  `HASH_ITERATIONS` int(11) DEFAULT NULL,
  `SALT` tinyblob DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `COUNTER` int(11) DEFAULT 0,
  `DIGITS` int(11) DEFAULT 6,
  `PERIOD` int(11) DEFAULT 30,
  `ALGORITHM` varchar(36) DEFAULT 'HmacSHA1',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_GROUP_MEMBERSHIP`
--

CREATE TABLE `FED_USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_REQUIRED_ACTION`
--

CREATE TABLE `FED_USER_REQUIRED_ACTION` (
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' ',
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `FED_USER_ROLE_MAPPING`
--

CREATE TABLE `FED_USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `STORAGE_PROVIDER_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GROUP_ATTRIBUTE`
--

CREATE TABLE `GROUP_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `GROUP_ROLE_MAPPING`
--

CREATE TABLE `GROUP_ROLE_MAPPING` (
  `ROLE_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IDENTITY_PROVIDER`
--

CREATE TABLE `IDENTITY_PROVIDER` (
  `INTERNAL_ID` varchar(36) NOT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ALIAS` varchar(255) DEFAULT NULL,
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `STORE_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `AUTHENTICATE_BY_DEFAULT` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ADD_TOKEN_ROLE` bit(1) NOT NULL DEFAULT b'1',
  `TRUST_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `FIRST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `POST_BROKER_LOGIN_FLOW_ID` varchar(36) DEFAULT NULL,
  `PROVIDER_DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `LINK_ONLY` bit(1) NOT NULL DEFAULT b'0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IDENTITY_PROVIDER_CONFIG`
--

CREATE TABLE `IDENTITY_PROVIDER_CONFIG` (
  `IDENTITY_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IDENTITY_PROVIDER_MAPPER`
--

CREATE TABLE `IDENTITY_PROVIDER_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `IDP_ALIAS` varchar(255) NOT NULL,
  `IDP_MAPPER_NAME` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `IDP_MAPPER_CONFIG`
--

CREATE TABLE `IDP_MAPPER_CONFIG` (
  `IDP_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `KEYCLOAK_GROUP`
--

CREATE TABLE `KEYCLOAK_GROUP` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `PARENT_GROUP` varchar(36) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `KEYCLOAK_ROLE`
--

CREATE TABLE `KEYCLOAK_ROLE` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_REALM_CONSTRAINT` varchar(36) DEFAULT NULL,
  `CLIENT_ROLE` bit(1) DEFAULT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `CLIENT` varchar(36) DEFAULT NULL,
  `REALM` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `MIGRATION_MODEL`
--

CREATE TABLE `MIGRATION_MODEL` (
  `ID` varchar(36) NOT NULL,
  `VERSION` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `OFFLINE_CLIENT_SESSION`
--

CREATE TABLE `OFFLINE_CLIENT_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `TIMESTAMP` int(11) DEFAULT NULL,
  `DATA` longtext DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) NOT NULL DEFAULT 'local',
  `EXTERNAL_CLIENT_ID` varchar(255) NOT NULL DEFAULT 'local'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `OFFLINE_USER_SESSION`
--

CREATE TABLE `OFFLINE_USER_SESSION` (
  `USER_SESSION_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL,
  `CREATED_ON` int(11) NOT NULL,
  `OFFLINE_FLAG` varchar(4) NOT NULL,
  `DATA` longtext DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `POLICY_CONFIG`
--

CREATE TABLE `POLICY_CONFIG` (
  `POLICY_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PROTOCOL_MAPPER`
--

CREATE TABLE `PROTOCOL_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `PROTOCOL` varchar(255) NOT NULL,
  `PROTOCOL_MAPPER_NAME` varchar(255) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `CLIENT_SCOPE_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `PROTOCOL_MAPPER_CONFIG`
--

CREATE TABLE `PROTOCOL_MAPPER_CONFIG` (
  `PROTOCOL_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM`
--

CREATE TABLE `REALM` (
  `ID` varchar(36) NOT NULL,
  `ACCESS_CODE_LIFESPAN` int(11) DEFAULT NULL,
  `USER_ACTION_LIFESPAN` int(11) DEFAULT NULL,
  `ACCESS_TOKEN_LIFESPAN` int(11) DEFAULT NULL,
  `ACCOUNT_THEME` varchar(255) DEFAULT NULL,
  `ADMIN_THEME` varchar(255) DEFAULT NULL,
  `EMAIL_THEME` varchar(255) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EVENTS_EXPIRATION` bigint(20) DEFAULT NULL,
  `LOGIN_THEME` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `NOT_BEFORE` int(11) DEFAULT NULL,
  `PASSWORD_POLICY` varchar(2550) DEFAULT NULL,
  `REGISTRATION_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `RESET_PASSWORD_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `SOCIAL` bit(1) NOT NULL DEFAULT b'0',
  `SSL_REQUIRED` varchar(255) DEFAULT NULL,
  `SSO_IDLE_TIMEOUT` int(11) DEFAULT NULL,
  `SSO_MAX_LIFESPAN` int(11) DEFAULT NULL,
  `UPDATE_PROFILE_ON_SOC_LOGIN` bit(1) NOT NULL DEFAULT b'0',
  `VERIFY_EMAIL` bit(1) NOT NULL DEFAULT b'0',
  `MASTER_ADMIN_CLIENT` varchar(36) DEFAULT NULL,
  `LOGIN_LIFESPAN` int(11) DEFAULT NULL,
  `INTERNATIONALIZATION_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_LOCALE` varchar(255) DEFAULT NULL,
  `REG_EMAIL_AS_USERNAME` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `ADMIN_EVENTS_DETAILS_ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `EDIT_USERNAME_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `OTP_POLICY_COUNTER` int(11) DEFAULT 0,
  `OTP_POLICY_WINDOW` int(11) DEFAULT 1,
  `OTP_POLICY_PERIOD` int(11) DEFAULT 30,
  `OTP_POLICY_DIGITS` int(11) DEFAULT 6,
  `OTP_POLICY_ALG` varchar(36) DEFAULT 'HmacSHA1',
  `OTP_POLICY_TYPE` varchar(36) DEFAULT 'totp',
  `BROWSER_FLOW` varchar(36) DEFAULT NULL,
  `REGISTRATION_FLOW` varchar(36) DEFAULT NULL,
  `DIRECT_GRANT_FLOW` varchar(36) DEFAULT NULL,
  `RESET_CREDENTIALS_FLOW` varchar(36) DEFAULT NULL,
  `CLIENT_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `OFFLINE_SESSION_IDLE_TIMEOUT` int(11) DEFAULT 0,
  `REVOKE_REFRESH_TOKEN` bit(1) NOT NULL DEFAULT b'0',
  `ACCESS_TOKEN_LIFE_IMPLICIT` int(11) DEFAULT 0,
  `LOGIN_WITH_EMAIL_ALLOWED` bit(1) NOT NULL DEFAULT b'1',
  `DUPLICATE_EMAILS_ALLOWED` bit(1) NOT NULL DEFAULT b'0',
  `DOCKER_AUTH_FLOW` varchar(36) DEFAULT NULL,
  `REFRESH_TOKEN_MAX_REUSE` int(11) DEFAULT 0,
  `ALLOW_USER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `SSO_MAX_LIFESPAN_REMEMBER_ME` int(11) NOT NULL,
  `SSO_IDLE_TIMEOUT_REMEMBER_ME` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_ATTRIBUTE`
--

CREATE TABLE `REALM_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_DEFAULT_GROUPS`
--

CREATE TABLE `REALM_DEFAULT_GROUPS` (
  `REALM_ID` varchar(36) NOT NULL,
  `GROUP_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_DEFAULT_ROLES`
--

CREATE TABLE `REALM_DEFAULT_ROLES` (
  `REALM_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_ENABLED_EVENT_TYPES`
--

CREATE TABLE `REALM_ENABLED_EVENT_TYPES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_EVENTS_LISTENERS`
--

CREATE TABLE `REALM_EVENTS_LISTENERS` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_REQUIRED_CREDENTIAL`
--

CREATE TABLE `REALM_REQUIRED_CREDENTIAL` (
  `TYPE` varchar(255) NOT NULL,
  `FORM_LABEL` varchar(255) DEFAULT NULL,
  `INPUT` bit(1) NOT NULL DEFAULT b'0',
  `SECRET` bit(1) NOT NULL DEFAULT b'0',
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_SMTP_CONFIG`
--

CREATE TABLE `REALM_SMTP_CONFIG` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REALM_SUPPORTED_LOCALES`
--

CREATE TABLE `REALM_SUPPORTED_LOCALES` (
  `REALM_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REDIRECT_URIS`
--

CREATE TABLE `REDIRECT_URIS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REQUIRED_ACTION_CONFIG`
--

CREATE TABLE `REQUIRED_ACTION_CONFIG` (
  `REQUIRED_ACTION_ID` varchar(36) NOT NULL,
  `VALUE` longtext DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `REQUIRED_ACTION_PROVIDER`
--

CREATE TABLE `REQUIRED_ACTION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `ALIAS` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL,
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `DEFAULT_ACTION` bit(1) NOT NULL DEFAULT b'0',
  `PROVIDER_ID` varchar(255) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_ATTRIBUTE`
--

CREATE TABLE `RESOURCE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here',
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_POLICY`
--

CREATE TABLE `RESOURCE_POLICY` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SCOPE`
--

CREATE TABLE `RESOURCE_SCOPE` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER`
--

CREATE TABLE `RESOURCE_SERVER` (
  `ID` varchar(36) NOT NULL,
  `ALLOW_RS_REMOTE_MGMT` bit(1) NOT NULL DEFAULT b'0',
  `POLICY_ENFORCE_MODE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER_PERM_TICKET`
--

CREATE TABLE `RESOURCE_SERVER_PERM_TICKET` (
  `ID` varchar(36) NOT NULL,
  `OWNER` varchar(36) NOT NULL,
  `REQUESTER` varchar(36) NOT NULL,
  `CREATED_TIMESTAMP` bigint(20) NOT NULL,
  `GRANTED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `RESOURCE_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER_POLICY`
--

CREATE TABLE `RESOURCE_SERVER_POLICY` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `DESCRIPTION` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `TYPE` varchar(255) NOT NULL,
  `DECISION_STRATEGY` varchar(20) DEFAULT NULL,
  `LOGIC` varchar(20) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER_RESOURCE`
--

CREATE TABLE `RESOURCE_SERVER_RESOURCE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `OWNER` varchar(36) NOT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `OWNER_MANAGED_ACCESS` bit(1) NOT NULL DEFAULT b'0',
  `DISPLAY_NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_SERVER_SCOPE`
--

CREATE TABLE `RESOURCE_SERVER_SCOPE` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `ICON_URI` varchar(255) DEFAULT NULL,
  `RESOURCE_SERVER_ID` varchar(36) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `RESOURCE_URIS`
--

CREATE TABLE `RESOURCE_URIS` (
  `RESOURCE_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `ROLE_ATTRIBUTE`
--

CREATE TABLE `ROLE_ATTRIBUTE` (
  `ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SCOPE_MAPPING`
--

CREATE TABLE `SCOPE_MAPPING` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `ROLE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `SCOPE_POLICY`
--

CREATE TABLE `SCOPE_POLICY` (
  `SCOPE_ID` varchar(36) NOT NULL,
  `POLICY_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USERNAME_LOGIN_FAILURE`
--

CREATE TABLE `USERNAME_LOGIN_FAILURE` (
  `REALM_ID` varchar(36) NOT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 NOT NULL,
  `FAILED_LOGIN_NOT_BEFORE` int(11) DEFAULT NULL,
  `LAST_FAILURE` bigint(20) DEFAULT NULL,
  `LAST_IP_FAILURE` varchar(255) DEFAULT NULL,
  `NUM_FAILURES` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_ATTRIBUTE`
--

CREATE TABLE `USER_ATTRIBUTE` (
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `ID` varchar(36) NOT NULL DEFAULT 'sybase-needs-something-here'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_CONSENT`
--

CREATE TABLE `USER_CONSENT` (
  `ID` varchar(36) NOT NULL,
  `CLIENT_ID` varchar(36) DEFAULT NULL,
  `USER_ID` varchar(36) NOT NULL,
  `CREATED_DATE` bigint(20) DEFAULT NULL,
  `LAST_UPDATED_DATE` bigint(20) DEFAULT NULL,
  `CLIENT_STORAGE_PROVIDER` varchar(36) DEFAULT NULL,
  `EXTERNAL_CLIENT_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_CONSENT_CLIENT_SCOPE`
--

CREATE TABLE `USER_CONSENT_CLIENT_SCOPE` (
  `USER_CONSENT_ID` varchar(36) NOT NULL,
  `SCOPE_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_ENTITY`
--

CREATE TABLE `USER_ENTITY` (
  `ID` varchar(36) NOT NULL,
  `EMAIL` varchar(255) DEFAULT NULL,
  `EMAIL_CONSTRAINT` varchar(255) DEFAULT NULL,
  `EMAIL_VERIFIED` bit(1) NOT NULL DEFAULT b'0',
  `ENABLED` bit(1) NOT NULL DEFAULT b'0',
  `FEDERATION_LINK` varchar(255) DEFAULT NULL,
  `FIRST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `LAST_NAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `USERNAME` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `CREATED_TIMESTAMP` bigint(20) DEFAULT NULL,
  `SERVICE_ACCOUNT_CLIENT_LINK` varchar(36) DEFAULT NULL,
  `NOT_BEFORE` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_FEDERATION_CONFIG`
--

CREATE TABLE `USER_FEDERATION_CONFIG` (
  `USER_FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_FEDERATION_MAPPER`
--

CREATE TABLE `USER_FEDERATION_MAPPER` (
  `ID` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `FEDERATION_PROVIDER_ID` varchar(36) NOT NULL,
  `FEDERATION_MAPPER_TYPE` varchar(255) NOT NULL,
  `REALM_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_FEDERATION_MAPPER_CONFIG`
--

CREATE TABLE `USER_FEDERATION_MAPPER_CONFIG` (
  `USER_FEDERATION_MAPPER_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) DEFAULT NULL,
  `NAME` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_FEDERATION_PROVIDER`
--

CREATE TABLE `USER_FEDERATION_PROVIDER` (
  `ID` varchar(36) NOT NULL,
  `CHANGED_SYNC_PERIOD` int(11) DEFAULT NULL,
  `DISPLAY_NAME` varchar(255) DEFAULT NULL,
  `FULL_SYNC_PERIOD` int(11) DEFAULT NULL,
  `LAST_SYNC` int(11) DEFAULT NULL,
  `PRIORITY` int(11) DEFAULT NULL,
  `PROVIDER_NAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_GROUP_MEMBERSHIP`
--

CREATE TABLE `USER_GROUP_MEMBERSHIP` (
  `GROUP_ID` varchar(36) NOT NULL,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_REQUIRED_ACTION`
--

CREATE TABLE `USER_REQUIRED_ACTION` (
  `USER_ID` varchar(36) NOT NULL,
  `REQUIRED_ACTION` varchar(255) NOT NULL DEFAULT ' '
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_ROLE_MAPPING`
--

CREATE TABLE `USER_ROLE_MAPPING` (
  `ROLE_ID` varchar(255) NOT NULL,
  `USER_ID` varchar(36) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_SESSION`
--

CREATE TABLE `USER_SESSION` (
  `ID` varchar(36) NOT NULL,
  `AUTH_METHOD` varchar(255) DEFAULT NULL,
  `IP_ADDRESS` varchar(255) DEFAULT NULL,
  `LAST_SESSION_REFRESH` int(11) DEFAULT NULL,
  `LOGIN_USERNAME` varchar(255) DEFAULT NULL,
  `REALM_ID` varchar(255) DEFAULT NULL,
  `REMEMBER_ME` bit(1) NOT NULL DEFAULT b'0',
  `STARTED` int(11) DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  `USER_SESSION_STATE` int(11) DEFAULT NULL,
  `BROKER_SESSION_ID` varchar(255) DEFAULT NULL,
  `BROKER_USER_ID` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `USER_SESSION_NOTE`
--

CREATE TABLE `USER_SESSION_NOTE` (
  `USER_SESSION` varchar(36) NOT NULL,
  `NAME` varchar(255) NOT NULL,
  `VALUE` varchar(2048) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `WEB_ORIGINS`
--

CREATE TABLE `WEB_ORIGINS` (
  `CLIENT_ID` varchar(36) NOT NULL,
  `VALUE` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ADMIN_EVENT_ENTITY`
--
ALTER TABLE `ADMIN_EVENT_ENTITY`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `ASSOCIATED_POLICY`
--
ALTER TABLE `ASSOCIATED_POLICY`
  ADD PRIMARY KEY (`POLICY_ID`,`ASSOCIATED_POLICY_ID`),
  ADD KEY `IDX_ASSOC_POL_ASSOC_POL_ID` (`ASSOCIATED_POLICY_ID`);

--
-- Indexes for table `AUTHENTICATION_EXECUTION`
--
ALTER TABLE `AUTHENTICATION_EXECUTION`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_EXEC_REALM_FLOW` (`REALM_ID`,`FLOW_ID`),
  ADD KEY `IDX_AUTH_EXEC_FLOW` (`FLOW_ID`);

--
-- Indexes for table `AUTHENTICATION_FLOW`
--
ALTER TABLE `AUTHENTICATION_FLOW`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_FLOW_REALM` (`REALM_ID`);

--
-- Indexes for table `AUTHENTICATOR_CONFIG`
--
ALTER TABLE `AUTHENTICATOR_CONFIG`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_AUTH_CONFIG_REALM` (`REALM_ID`);

--
-- Indexes for table `AUTHENTICATOR_CONFIG_ENTRY`
--
ALTER TABLE `AUTHENTICATOR_CONFIG_ENTRY`
  ADD PRIMARY KEY (`AUTHENTICATOR_ID`,`NAME`);

--
-- Indexes for table `BROKER_LINK`
--
ALTER TABLE `BROKER_LINK`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`);

--
-- Indexes for table `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_B71CJLBENV945RB6GCON438AT` (`REALM_ID`,`CLIENT_ID`);

--
-- Indexes for table `CLIENT_ATTRIBUTES`
--
ALTER TABLE `CLIENT_ATTRIBUTES`
  ADD PRIMARY KEY (`CLIENT_ID`,`NAME`);

--
-- Indexes for table `CLIENT_AUTH_FLOW_BINDINGS`
--
ALTER TABLE `CLIENT_AUTH_FLOW_BINDINGS`
  ADD PRIMARY KEY (`CLIENT_ID`,`BINDING_NAME`);

--
-- Indexes for table `CLIENT_DEFAULT_ROLES`
--
ALTER TABLE `CLIENT_DEFAULT_ROLES`
  ADD PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  ADD UNIQUE KEY `UK_8AELWNIBJI49AVXSRTUF6XJOW` (`ROLE_ID`),
  ADD KEY `IDX_CLIENT_DEF_ROLES_CLIENT` (`CLIENT_ID`);

--
-- Indexes for table `CLIENT_INITIAL_ACCESS`
--
ALTER TABLE `CLIENT_INITIAL_ACCESS`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_CLIENT_INIT_ACC_REALM` (`REALM_ID`);

--
-- Indexes for table `CLIENT_NODE_REGISTRATIONS`
--
ALTER TABLE `CLIENT_NODE_REGISTRATIONS`
  ADD PRIMARY KEY (`CLIENT_ID`,`NAME`);

--
-- Indexes for table `CLIENT_SCOPE`
--
ALTER TABLE `CLIENT_SCOPE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_CLI_SCOPE` (`REALM_ID`,`NAME`),
  ADD KEY `IDX_REALM_CLSCOPE` (`REALM_ID`);

--
-- Indexes for table `CLIENT_SCOPE_ATTRIBUTES`
--
ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES`
  ADD PRIMARY KEY (`SCOPE_ID`,`NAME`),
  ADD KEY `IDX_CLSCOPE_ATTRS` (`SCOPE_ID`);

--
-- Indexes for table `CLIENT_SCOPE_CLIENT`
--
ALTER TABLE `CLIENT_SCOPE_CLIENT`
  ADD PRIMARY KEY (`CLIENT_ID`,`SCOPE_ID`),
  ADD KEY `IDX_CLSCOPE_CL` (`CLIENT_ID`),
  ADD KEY `IDX_CL_CLSCOPE` (`SCOPE_ID`);

--
-- Indexes for table `CLIENT_SCOPE_ROLE_MAPPING`
--
ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING`
  ADD PRIMARY KEY (`SCOPE_ID`,`ROLE_ID`),
  ADD KEY `IDX_CLSCOPE_ROLE` (`SCOPE_ID`),
  ADD KEY `IDX_ROLE_CLSCOPE` (`ROLE_ID`);

--
-- Indexes for table `CLIENT_SESSION`
--
ALTER TABLE `CLIENT_SESSION`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_CLIENT_SESSION_SESSION` (`SESSION_ID`);

--
-- Indexes for table `CLIENT_SESSION_AUTH_STATUS`
--
ALTER TABLE `CLIENT_SESSION_AUTH_STATUS`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`AUTHENTICATOR`);

--
-- Indexes for table `CLIENT_SESSION_NOTE`
--
ALTER TABLE `CLIENT_SESSION_NOTE`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`NAME`);

--
-- Indexes for table `CLIENT_SESSION_PROT_MAPPER`
--
ALTER TABLE `CLIENT_SESSION_PROT_MAPPER`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`PROTOCOL_MAPPER_ID`);

--
-- Indexes for table `CLIENT_SESSION_ROLE`
--
ALTER TABLE `CLIENT_SESSION_ROLE`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`ROLE_ID`);

--
-- Indexes for table `CLIENT_USER_SESSION_NOTE`
--
ALTER TABLE `CLIENT_USER_SESSION_NOTE`
  ADD PRIMARY KEY (`CLIENT_SESSION`,`NAME`);

--
-- Indexes for table `COMPONENT`
--
ALTER TABLE `COMPONENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_COMPONENT_REALM` (`REALM_ID`),
  ADD KEY `IDX_COMPONENT_PROVIDER_TYPE` (`PROVIDER_TYPE`);

--
-- Indexes for table `COMPONENT_CONFIG`
--
ALTER TABLE `COMPONENT_CONFIG`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_COMPO_CONFIG_COMPO` (`COMPONENT_ID`);

--
-- Indexes for table `COMPOSITE_ROLE`
--
ALTER TABLE `COMPOSITE_ROLE`
  ADD PRIMARY KEY (`COMPOSITE`,`CHILD_ROLE`),
  ADD KEY `IDX_COMPOSITE` (`COMPOSITE`),
  ADD KEY `IDX_COMPOSITE_CHILD` (`CHILD_ROLE`);

--
-- Indexes for table `CREDENTIAL`
--
ALTER TABLE `CREDENTIAL`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USER_CREDENTIAL` (`USER_ID`);

--
-- Indexes for table `CREDENTIAL_ATTRIBUTE`
--
ALTER TABLE `CREDENTIAL_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_CREDENTIAL_ATTR_CRED` (`CREDENTIAL_ID`);

--
-- Indexes for table `DATABASECHANGELOGLOCK`
--
ALTER TABLE `DATABASECHANGELOGLOCK`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `DEFAULT_CLIENT_SCOPE`
--
ALTER TABLE `DEFAULT_CLIENT_SCOPE`
  ADD PRIMARY KEY (`REALM_ID`,`SCOPE_ID`),
  ADD KEY `IDX_DEFCLS_REALM` (`REALM_ID`),
  ADD KEY `IDX_DEFCLS_SCOPE` (`SCOPE_ID`);

--
-- Indexes for table `EVENT_ENTITY`
--
ALTER TABLE `EVENT_ENTITY`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `FEDERATED_IDENTITY`
--
ALTER TABLE `FEDERATED_IDENTITY`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER`,`USER_ID`),
  ADD KEY `IDX_FEDIDENTITY_USER` (`USER_ID`),
  ADD KEY `IDX_FEDIDENTITY_FEDUSER` (`FEDERATED_USER_ID`);

--
-- Indexes for table `FEDERATED_USER`
--
ALTER TABLE `FEDERATED_USER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `FED_CREDENTIAL_ATTRIBUTE`
--
ALTER TABLE `FED_CREDENTIAL_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FED_CRED_ATTR_CRED` (`CREDENTIAL_ID`);

--
-- Indexes for table `FED_USER_ATTRIBUTE`
--
ALTER TABLE `FED_USER_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_ATTRIBUTE` (`USER_ID`,`REALM_ID`,`NAME`);

--
-- Indexes for table `FED_USER_CONSENT`
--
ALTER TABLE `FED_USER_CONSENT`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_CONSENT` (`USER_ID`,`CLIENT_ID`),
  ADD KEY `IDX_FU_CONSENT_RU` (`REALM_ID`,`USER_ID`),
  ADD KEY `IDX_FU_CNSNT_EXT` (`USER_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`);

--
-- Indexes for table `FED_USER_CONSENT_CL_SCOPE`
--
ALTER TABLE `FED_USER_CONSENT_CL_SCOPE`
  ADD PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`);

--
-- Indexes for table `FED_USER_CREDENTIAL`
--
ALTER TABLE `FED_USER_CREDENTIAL`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_FU_CREDENTIAL` (`USER_ID`,`TYPE`),
  ADD KEY `IDX_FU_CREDENTIAL_RU` (`REALM_ID`,`USER_ID`);

--
-- Indexes for table `FED_USER_GROUP_MEMBERSHIP`
--
ALTER TABLE `FED_USER_GROUP_MEMBERSHIP`
  ADD PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  ADD KEY `IDX_FU_GROUP_MEMBERSHIP` (`USER_ID`,`GROUP_ID`),
  ADD KEY `IDX_FU_GROUP_MEMBERSHIP_RU` (`REALM_ID`,`USER_ID`);

--
-- Indexes for table `FED_USER_REQUIRED_ACTION`
--
ALTER TABLE `FED_USER_REQUIRED_ACTION`
  ADD PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  ADD KEY `IDX_FU_REQUIRED_ACTION` (`USER_ID`,`REQUIRED_ACTION`),
  ADD KEY `IDX_FU_REQUIRED_ACTION_RU` (`REALM_ID`,`USER_ID`);

--
-- Indexes for table `FED_USER_ROLE_MAPPING`
--
ALTER TABLE `FED_USER_ROLE_MAPPING`
  ADD PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  ADD KEY `IDX_FU_ROLE_MAPPING` (`USER_ID`,`ROLE_ID`),
  ADD KEY `IDX_FU_ROLE_MAPPING_RU` (`REALM_ID`,`USER_ID`);

--
-- Indexes for table `GROUP_ATTRIBUTE`
--
ALTER TABLE `GROUP_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_GROUP_ATTR_GROUP` (`GROUP_ID`);

--
-- Indexes for table `GROUP_ROLE_MAPPING`
--
ALTER TABLE `GROUP_ROLE_MAPPING`
  ADD PRIMARY KEY (`ROLE_ID`,`GROUP_ID`),
  ADD KEY `IDX_GROUP_ROLE_MAPP_GROUP` (`GROUP_ID`);

--
-- Indexes for table `IDENTITY_PROVIDER`
--
ALTER TABLE `IDENTITY_PROVIDER`
  ADD PRIMARY KEY (`INTERNAL_ID`),
  ADD UNIQUE KEY `UK_2DAELWNIBJI49AVXSRTUF6XJ33` (`PROVIDER_ALIAS`,`REALM_ID`),
  ADD KEY `IDX_IDENT_PROV_REALM` (`REALM_ID`);

--
-- Indexes for table `IDENTITY_PROVIDER_CONFIG`
--
ALTER TABLE `IDENTITY_PROVIDER_CONFIG`
  ADD PRIMARY KEY (`IDENTITY_PROVIDER_ID`,`NAME`);

--
-- Indexes for table `IDENTITY_PROVIDER_MAPPER`
--
ALTER TABLE `IDENTITY_PROVIDER_MAPPER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_ID_PROV_MAPP_REALM` (`REALM_ID`);

--
-- Indexes for table `IDP_MAPPER_CONFIG`
--
ALTER TABLE `IDP_MAPPER_CONFIG`
  ADD PRIMARY KEY (`IDP_MAPPER_ID`,`NAME`);

--
-- Indexes for table `KEYCLOAK_GROUP`
--
ALTER TABLE `KEYCLOAK_GROUP`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `SIBLING_NAMES` (`REALM_ID`,`PARENT_GROUP`,`NAME`);

--
-- Indexes for table `KEYCLOAK_ROLE`
--
ALTER TABLE `KEYCLOAK_ROLE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_J3RWUVD56ONTGSUHOGM184WW2-2` (`NAME`,`CLIENT_REALM_CONSTRAINT`),
  ADD KEY `IDX_KEYCLOAK_ROLE_CLIENT` (`CLIENT`),
  ADD KEY `IDX_KEYCLOAK_ROLE_REALM` (`REALM`);

--
-- Indexes for table `MIGRATION_MODEL`
--
ALTER TABLE `MIGRATION_MODEL`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `OFFLINE_CLIENT_SESSION`
--
ALTER TABLE `OFFLINE_CLIENT_SESSION`
  ADD PRIMARY KEY (`USER_SESSION_ID`,`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`OFFLINE_FLAG`),
  ADD KEY `IDX_US_SESS_ID_ON_CL_SESS` (`USER_SESSION_ID`);

--
-- Indexes for table `OFFLINE_USER_SESSION`
--
ALTER TABLE `OFFLINE_USER_SESSION`
  ADD PRIMARY KEY (`USER_SESSION_ID`,`OFFLINE_FLAG`),
  ADD KEY `IDX_OFFLINE_USS_CREATEDON` (`CREATED_ON`);

--
-- Indexes for table `POLICY_CONFIG`
--
ALTER TABLE `POLICY_CONFIG`
  ADD PRIMARY KEY (`POLICY_ID`,`NAME`);

--
-- Indexes for table `PROTOCOL_MAPPER`
--
ALTER TABLE `PROTOCOL_MAPPER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_PROTOCOL_MAPPER_CLIENT` (`CLIENT_ID`),
  ADD KEY `IDX_CLSCOPE_PROTMAP` (`CLIENT_SCOPE_ID`);

--
-- Indexes for table `PROTOCOL_MAPPER_CONFIG`
--
ALTER TABLE `PROTOCOL_MAPPER_CONFIG`
  ADD PRIMARY KEY (`PROTOCOL_MAPPER_ID`,`NAME`);

--
-- Indexes for table `REALM`
--
ALTER TABLE `REALM`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_ORVSDMLA56612EAEFIQ6WL5OI` (`NAME`),
  ADD KEY `IDX_REALM_MASTER_ADM_CLI` (`MASTER_ADMIN_CLIENT`);

--
-- Indexes for table `REALM_ATTRIBUTE`
--
ALTER TABLE `REALM_ATTRIBUTE`
  ADD PRIMARY KEY (`NAME`,`REALM_ID`),
  ADD KEY `IDX_REALM_ATTR_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_DEFAULT_GROUPS`
--
ALTER TABLE `REALM_DEFAULT_GROUPS`
  ADD PRIMARY KEY (`REALM_ID`,`GROUP_ID`),
  ADD UNIQUE KEY `CON_GROUP_ID_DEF_GROUPS` (`GROUP_ID`),
  ADD KEY `IDX_REALM_DEF_GRP_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_DEFAULT_ROLES`
--
ALTER TABLE `REALM_DEFAULT_ROLES`
  ADD PRIMARY KEY (`REALM_ID`,`ROLE_ID`),
  ADD UNIQUE KEY `UK_H4WPD7W4HSOOLNI3H0SW7BTJE` (`ROLE_ID`),
  ADD KEY `IDX_REALM_DEF_ROLES_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_ENABLED_EVENT_TYPES`
--
ALTER TABLE `REALM_ENABLED_EVENT_TYPES`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_EVT_TYPES_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_EVENTS_LISTENERS`
--
ALTER TABLE `REALM_EVENTS_LISTENERS`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_EVT_LIST_REALM` (`REALM_ID`);

--
-- Indexes for table `REALM_REQUIRED_CREDENTIAL`
--
ALTER TABLE `REALM_REQUIRED_CREDENTIAL`
  ADD PRIMARY KEY (`REALM_ID`,`TYPE`);

--
-- Indexes for table `REALM_SMTP_CONFIG`
--
ALTER TABLE `REALM_SMTP_CONFIG`
  ADD PRIMARY KEY (`REALM_ID`,`NAME`);

--
-- Indexes for table `REALM_SUPPORTED_LOCALES`
--
ALTER TABLE `REALM_SUPPORTED_LOCALES`
  ADD PRIMARY KEY (`REALM_ID`,`VALUE`),
  ADD KEY `IDX_REALM_SUPP_LOCAL_REALM` (`REALM_ID`);

--
-- Indexes for table `REDIRECT_URIS`
--
ALTER TABLE `REDIRECT_URIS`
  ADD PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  ADD KEY `IDX_REDIR_URI_CLIENT` (`CLIENT_ID`);

--
-- Indexes for table `REQUIRED_ACTION_CONFIG`
--
ALTER TABLE `REQUIRED_ACTION_CONFIG`
  ADD PRIMARY KEY (`REQUIRED_ACTION_ID`,`NAME`);

--
-- Indexes for table `REQUIRED_ACTION_PROVIDER`
--
ALTER TABLE `REQUIRED_ACTION_PROVIDER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_REQ_ACT_PROV_REALM` (`REALM_ID`);

--
-- Indexes for table `RESOURCE_ATTRIBUTE`
--
ALTER TABLE `RESOURCE_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `FK_5HRM2VLF9QL5FU022KQEPOVBR` (`RESOURCE_ID`);

--
-- Indexes for table `RESOURCE_POLICY`
--
ALTER TABLE `RESOURCE_POLICY`
  ADD PRIMARY KEY (`RESOURCE_ID`,`POLICY_ID`),
  ADD KEY `IDX_RES_POLICY_POLICY` (`POLICY_ID`);

--
-- Indexes for table `RESOURCE_SCOPE`
--
ALTER TABLE `RESOURCE_SCOPE`
  ADD PRIMARY KEY (`RESOURCE_ID`,`SCOPE_ID`),
  ADD KEY `IDX_RES_SCOPE_SCOPE` (`SCOPE_ID`);

--
-- Indexes for table `RESOURCE_SERVER`
--
ALTER TABLE `RESOURCE_SERVER`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `RESOURCE_SERVER_PERM_TICKET`
--
ALTER TABLE `RESOURCE_SERVER_PERM_TICKET`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5PMT` (`OWNER`,`REQUESTER`,`RESOURCE_SERVER_ID`,`RESOURCE_ID`,`SCOPE_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG82SSPMT` (`RESOURCE_SERVER_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG83SSPMT` (`RESOURCE_ID`),
  ADD KEY `FK_FRSRHO213XCX4WNKOG84SSPMT` (`SCOPE_ID`),
  ADD KEY `FK_FRSRPO2128CX4WNKOG82SSRFY` (`POLICY_ID`);

--
-- Indexes for table `RESOURCE_SERVER_POLICY`
--
ALTER TABLE `RESOURCE_SERVER_POLICY`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSRPT700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SERV_POL_RES_SERV` (`RESOURCE_SERVER_ID`);

--
-- Indexes for table `RESOURCE_SERVER_RESOURCE`
--
ALTER TABLE `RESOURCE_SERVER_RESOURCE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSR6T700S9V50BU18WS5HA6` (`NAME`,`OWNER`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SRV_RES_RES_SRV` (`RESOURCE_SERVER_ID`);

--
-- Indexes for table `RESOURCE_SERVER_SCOPE`
--
ALTER TABLE `RESOURCE_SERVER_SCOPE`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_FRSRST700S9V50BU18WS5HA6` (`NAME`,`RESOURCE_SERVER_ID`),
  ADD KEY `IDX_RES_SRV_SCOPE_RES_SRV` (`RESOURCE_SERVER_ID`);

--
-- Indexes for table `RESOURCE_URIS`
--
ALTER TABLE `RESOURCE_URIS`
  ADD KEY `FK_RESOURCE_SERVER_URIS` (`RESOURCE_ID`);

--
-- Indexes for table `ROLE_ATTRIBUTE`
--
ALTER TABLE `ROLE_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_ROLE_ATTRIBUTE` (`ROLE_ID`);

--
-- Indexes for table `SCOPE_MAPPING`
--
ALTER TABLE `SCOPE_MAPPING`
  ADD PRIMARY KEY (`CLIENT_ID`,`ROLE_ID`),
  ADD KEY `IDX_SCOPE_MAPPING_ROLE` (`ROLE_ID`);

--
-- Indexes for table `SCOPE_POLICY`
--
ALTER TABLE `SCOPE_POLICY`
  ADD PRIMARY KEY (`SCOPE_ID`,`POLICY_ID`),
  ADD KEY `IDX_SCOPE_POLICY_POLICY` (`POLICY_ID`);

--
-- Indexes for table `USERNAME_LOGIN_FAILURE`
--
ALTER TABLE `USERNAME_LOGIN_FAILURE`
  ADD PRIMARY KEY (`REALM_ID`,`USERNAME`);

--
-- Indexes for table `USER_ATTRIBUTE`
--
ALTER TABLE `USER_ATTRIBUTE`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USER_ATTRIBUTE` (`USER_ID`);

--
-- Indexes for table `USER_CONSENT`
--
ALTER TABLE `USER_CONSENT`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_JKUWUVD56ONTGSUHOGM8UEWRT` (`CLIENT_ID`,`CLIENT_STORAGE_PROVIDER`,`EXTERNAL_CLIENT_ID`,`USER_ID`),
  ADD KEY `IDX_USER_CONSENT` (`USER_ID`);

--
-- Indexes for table `USER_CONSENT_CLIENT_SCOPE`
--
ALTER TABLE `USER_CONSENT_CLIENT_SCOPE`
  ADD PRIMARY KEY (`USER_CONSENT_ID`,`SCOPE_ID`),
  ADD KEY `IDX_USCONSENT_CLSCOPE` (`USER_CONSENT_ID`);

--
-- Indexes for table `USER_ENTITY`
--
ALTER TABLE `USER_ENTITY`
  ADD PRIMARY KEY (`ID`),
  ADD UNIQUE KEY `UK_DYKN684SL8UP1CRFEI6ECKHD7` (`REALM_ID`,`EMAIL_CONSTRAINT`),
  ADD UNIQUE KEY `UK_RU8TT6T700S9V50BU18WS5HA6` (`REALM_ID`,`USERNAME`),
  ADD KEY `IDX_USER_EMAIL` (`EMAIL`);

--
-- Indexes for table `USER_FEDERATION_CONFIG`
--
ALTER TABLE `USER_FEDERATION_CONFIG`
  ADD PRIMARY KEY (`USER_FEDERATION_PROVIDER_ID`,`NAME`);

--
-- Indexes for table `USER_FEDERATION_MAPPER`
--
ALTER TABLE `USER_FEDERATION_MAPPER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USR_FED_MAP_FED_PRV` (`FEDERATION_PROVIDER_ID`),
  ADD KEY `IDX_USR_FED_MAP_REALM` (`REALM_ID`);

--
-- Indexes for table `USER_FEDERATION_MAPPER_CONFIG`
--
ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG`
  ADD PRIMARY KEY (`USER_FEDERATION_MAPPER_ID`,`NAME`);

--
-- Indexes for table `USER_FEDERATION_PROVIDER`
--
ALTER TABLE `USER_FEDERATION_PROVIDER`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `IDX_USR_FED_PRV_REALM` (`REALM_ID`);

--
-- Indexes for table `USER_GROUP_MEMBERSHIP`
--
ALTER TABLE `USER_GROUP_MEMBERSHIP`
  ADD PRIMARY KEY (`GROUP_ID`,`USER_ID`),
  ADD KEY `IDX_USER_GROUP_MAPPING` (`USER_ID`);

--
-- Indexes for table `USER_REQUIRED_ACTION`
--
ALTER TABLE `USER_REQUIRED_ACTION`
  ADD PRIMARY KEY (`REQUIRED_ACTION`,`USER_ID`),
  ADD KEY `IDX_USER_REQACTIONS` (`USER_ID`);

--
-- Indexes for table `USER_ROLE_MAPPING`
--
ALTER TABLE `USER_ROLE_MAPPING`
  ADD PRIMARY KEY (`ROLE_ID`,`USER_ID`),
  ADD KEY `IDX_USER_ROLE_MAPPING` (`USER_ID`);

--
-- Indexes for table `USER_SESSION`
--
ALTER TABLE `USER_SESSION`
  ADD PRIMARY KEY (`ID`);

--
-- Indexes for table `USER_SESSION_NOTE`
--
ALTER TABLE `USER_SESSION_NOTE`
  ADD PRIMARY KEY (`USER_SESSION`,`NAME`);

--
-- Indexes for table `WEB_ORIGINS`
--
ALTER TABLE `WEB_ORIGINS`
  ADD PRIMARY KEY (`CLIENT_ID`,`VALUE`),
  ADD KEY `IDX_WEB_ORIG_CLIENT` (`CLIENT_ID`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `ASSOCIATED_POLICY`
--
ALTER TABLE `ASSOCIATED_POLICY`
  ADD CONSTRAINT `FK_FRSR5S213XCX4WNKOG82SSRFY` FOREIGN KEY (`ASSOCIATED_POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  ADD CONSTRAINT `FK_FRSRPAS14XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`);

--
-- Constraints for table `AUTHENTICATION_EXECUTION`
--
ALTER TABLE `AUTHENTICATION_EXECUTION`
  ADD CONSTRAINT `FK_AUTH_EXEC_FLOW` FOREIGN KEY (`FLOW_ID`) REFERENCES `AUTHENTICATION_FLOW` (`ID`),
  ADD CONSTRAINT `FK_AUTH_EXEC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `AUTHENTICATION_FLOW`
--
ALTER TABLE `AUTHENTICATION_FLOW`
  ADD CONSTRAINT `FK_AUTH_FLOW_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `AUTHENTICATOR_CONFIG`
--
ALTER TABLE `AUTHENTICATOR_CONFIG`
  ADD CONSTRAINT `FK_AUTH_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `CLIENT`
--
ALTER TABLE `CLIENT`
  ADD CONSTRAINT `FK_P56CTINXXB9GSK57FO49F9TAC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `CLIENT_ATTRIBUTES`
--
ALTER TABLE `CLIENT_ATTRIBUTES`
  ADD CONSTRAINT `FK3C47C64BEACCA966` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `CLIENT_DEFAULT_ROLES`
--
ALTER TABLE `CLIENT_DEFAULT_ROLES`
  ADD CONSTRAINT `FK_8AELWNIBJI49AVXSRTUF6XJOW` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  ADD CONSTRAINT `FK_NUILTS7KLWQW2H8M2B5JOYTKY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `CLIENT_INITIAL_ACCESS`
--
ALTER TABLE `CLIENT_INITIAL_ACCESS`
  ADD CONSTRAINT `FK_CLIENT_INIT_ACC_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `CLIENT_NODE_REGISTRATIONS`
--
ALTER TABLE `CLIENT_NODE_REGISTRATIONS`
  ADD CONSTRAINT `FK4129723BA992F594` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `CLIENT_SCOPE`
--
ALTER TABLE `CLIENT_SCOPE`
  ADD CONSTRAINT `FK_REALM_CLI_SCOPE` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `CLIENT_SCOPE_ATTRIBUTES`
--
ALTER TABLE `CLIENT_SCOPE_ATTRIBUTES`
  ADD CONSTRAINT `FK_CL_SCOPE_ATTR_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`);

--
-- Constraints for table `CLIENT_SCOPE_CLIENT`
--
ALTER TABLE `CLIENT_SCOPE_CLIENT`
  ADD CONSTRAINT `FK_C_CLI_SCOPE_CLIENT` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  ADD CONSTRAINT `FK_C_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`);

--
-- Constraints for table `CLIENT_SCOPE_ROLE_MAPPING`
--
ALTER TABLE `CLIENT_SCOPE_ROLE_MAPPING`
  ADD CONSTRAINT `FK_CL_SCOPE_RM_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  ADD CONSTRAINT `FK_CL_SCOPE_RM_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`);

--
-- Constraints for table `CLIENT_SESSION`
--
ALTER TABLE `CLIENT_SESSION`
  ADD CONSTRAINT `FK_B4AO2VCVAT6UKAU74WBWTFQO1` FOREIGN KEY (`SESSION_ID`) REFERENCES `USER_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_SESSION_AUTH_STATUS`
--
ALTER TABLE `CLIENT_SESSION_AUTH_STATUS`
  ADD CONSTRAINT `AUTH_STATUS_CONSTRAINT` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_SESSION_NOTE`
--
ALTER TABLE `CLIENT_SESSION_NOTE`
  ADD CONSTRAINT `FK5EDFB00FF51C2736` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_SESSION_PROT_MAPPER`
--
ALTER TABLE `CLIENT_SESSION_PROT_MAPPER`
  ADD CONSTRAINT `FK_33A8SGQW18I532811V7O2DK89` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_SESSION_ROLE`
--
ALTER TABLE `CLIENT_SESSION_ROLE`
  ADD CONSTRAINT `FK_11B7SGQW18I532811V7O2DV76` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `CLIENT_USER_SESSION_NOTE`
--
ALTER TABLE `CLIENT_USER_SESSION_NOTE`
  ADD CONSTRAINT `FK_CL_USR_SES_NOTE` FOREIGN KEY (`CLIENT_SESSION`) REFERENCES `CLIENT_SESSION` (`ID`);

--
-- Constraints for table `COMPONENT`
--
ALTER TABLE `COMPONENT`
  ADD CONSTRAINT `FK_COMPONENT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `COMPONENT_CONFIG`
--
ALTER TABLE `COMPONENT_CONFIG`
  ADD CONSTRAINT `FK_COMPONENT_CONFIG` FOREIGN KEY (`COMPONENT_ID`) REFERENCES `COMPONENT` (`ID`);

--
-- Constraints for table `COMPOSITE_ROLE`
--
ALTER TABLE `COMPOSITE_ROLE`
  ADD CONSTRAINT `FK_A63WVEKFTU8JO1PNJ81E7MCE2` FOREIGN KEY (`COMPOSITE`) REFERENCES `KEYCLOAK_ROLE` (`ID`),
  ADD CONSTRAINT `FK_GR7THLLB9LU8Q4VQA4524JJY8` FOREIGN KEY (`CHILD_ROLE`) REFERENCES `KEYCLOAK_ROLE` (`ID`);

--
-- Constraints for table `CREDENTIAL`
--
ALTER TABLE `CREDENTIAL`
  ADD CONSTRAINT `FK_PFYR0GLASQYL0DEI3KL69R6V0` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `CREDENTIAL_ATTRIBUTE`
--
ALTER TABLE `CREDENTIAL_ATTRIBUTE`
  ADD CONSTRAINT `FK_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `CREDENTIAL` (`ID`);

--
-- Constraints for table `DEFAULT_CLIENT_SCOPE`
--
ALTER TABLE `DEFAULT_CLIENT_SCOPE`
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  ADD CONSTRAINT `FK_R_DEF_CLI_SCOPE_SCOPE` FOREIGN KEY (`SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`);

--
-- Constraints for table `FEDERATED_IDENTITY`
--
ALTER TABLE `FEDERATED_IDENTITY`
  ADD CONSTRAINT `FK404288B92EF007A6` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `FED_CREDENTIAL_ATTRIBUTE`
--
ALTER TABLE `FED_CREDENTIAL_ATTRIBUTE`
  ADD CONSTRAINT `FK_FED_CRED_ATTR` FOREIGN KEY (`CREDENTIAL_ID`) REFERENCES `FED_USER_CREDENTIAL` (`ID`);

--
-- Constraints for table `GROUP_ATTRIBUTE`
--
ALTER TABLE `GROUP_ATTRIBUTE`
  ADD CONSTRAINT `FK_GROUP_ATTRIBUTE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`);

--
-- Constraints for table `GROUP_ROLE_MAPPING`
--
ALTER TABLE `GROUP_ROLE_MAPPING`
  ADD CONSTRAINT `FK_GROUP_ROLE_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  ADD CONSTRAINT `FK_GROUP_ROLE_ROLE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`);

--
-- Constraints for table `IDENTITY_PROVIDER`
--
ALTER TABLE `IDENTITY_PROVIDER`
  ADD CONSTRAINT `FK2B4EBC52AE5C3B34` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `IDENTITY_PROVIDER_CONFIG`
--
ALTER TABLE `IDENTITY_PROVIDER_CONFIG`
  ADD CONSTRAINT `FKDC4897CF864C4E43` FOREIGN KEY (`IDENTITY_PROVIDER_ID`) REFERENCES `IDENTITY_PROVIDER` (`INTERNAL_ID`);

--
-- Constraints for table `IDENTITY_PROVIDER_MAPPER`
--
ALTER TABLE `IDENTITY_PROVIDER_MAPPER`
  ADD CONSTRAINT `FK_IDPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `IDP_MAPPER_CONFIG`
--
ALTER TABLE `IDP_MAPPER_CONFIG`
  ADD CONSTRAINT `FK_IDPMCONFIG` FOREIGN KEY (`IDP_MAPPER_ID`) REFERENCES `IDENTITY_PROVIDER_MAPPER` (`ID`);

--
-- Constraints for table `KEYCLOAK_GROUP`
--
ALTER TABLE `KEYCLOAK_GROUP`
  ADD CONSTRAINT `FK_GROUP_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `KEYCLOAK_ROLE`
--
ALTER TABLE `KEYCLOAK_ROLE`
  ADD CONSTRAINT `FK_6VYQFE4CN4WLQ8R6KT5VDSJ5C` FOREIGN KEY (`REALM`) REFERENCES `REALM` (`ID`),
  ADD CONSTRAINT `FK_KJHO5LE2C0RAL09FL8CM9WFW9` FOREIGN KEY (`CLIENT`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `POLICY_CONFIG`
--
ALTER TABLE `POLICY_CONFIG`
  ADD CONSTRAINT `FKDC34197CF864C4E43` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`);

--
-- Constraints for table `PROTOCOL_MAPPER`
--
ALTER TABLE `PROTOCOL_MAPPER`
  ADD CONSTRAINT `FK_CLI_SCOPE_MAPPER` FOREIGN KEY (`CLIENT_SCOPE_ID`) REFERENCES `CLIENT_SCOPE` (`ID`),
  ADD CONSTRAINT `FK_PCM_REALM` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `PROTOCOL_MAPPER_CONFIG`
--
ALTER TABLE `PROTOCOL_MAPPER_CONFIG`
  ADD CONSTRAINT `FK_PMCONFIG` FOREIGN KEY (`PROTOCOL_MAPPER_ID`) REFERENCES `PROTOCOL_MAPPER` (`ID`);

--
-- Constraints for table `REALM`
--
ALTER TABLE `REALM`
  ADD CONSTRAINT `FK_TRAF444KK6QRKMS7N56AIWQ5Y` FOREIGN KEY (`MASTER_ADMIN_CLIENT`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `REALM_ATTRIBUTE`
--
ALTER TABLE `REALM_ATTRIBUTE`
  ADD CONSTRAINT `FK_8SHXD6L3E9ATQUKACXGPFFPTW` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_DEFAULT_GROUPS`
--
ALTER TABLE `REALM_DEFAULT_GROUPS`
  ADD CONSTRAINT `FK_DEF_GROUPS_GROUP` FOREIGN KEY (`GROUP_ID`) REFERENCES `KEYCLOAK_GROUP` (`ID`),
  ADD CONSTRAINT `FK_DEF_GROUPS_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_DEFAULT_ROLES`
--
ALTER TABLE `REALM_DEFAULT_ROLES`
  ADD CONSTRAINT `FK_EVUDB1PPW84OXFAX2DRS03ICC` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`),
  ADD CONSTRAINT `FK_H4WPD7W4HSOOLNI3H0SW7BTJE` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`);

--
-- Constraints for table `REALM_ENABLED_EVENT_TYPES`
--
ALTER TABLE `REALM_ENABLED_EVENT_TYPES`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NWEDRF5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_EVENTS_LISTENERS`
--
ALTER TABLE `REALM_EVENTS_LISTENERS`
  ADD CONSTRAINT `FK_H846O4H0W8EPX5NXEV9F5Y69J` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_REQUIRED_CREDENTIAL`
--
ALTER TABLE `REALM_REQUIRED_CREDENTIAL`
  ADD CONSTRAINT `FK_5HG65LYBEVAVKQFKI3KPONH9V` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_SMTP_CONFIG`
--
ALTER TABLE `REALM_SMTP_CONFIG`
  ADD CONSTRAINT `FK_70EJ8XDXGXD0B9HH6180IRR0O` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REALM_SUPPORTED_LOCALES`
--
ALTER TABLE `REALM_SUPPORTED_LOCALES`
  ADD CONSTRAINT `FK_SUPPORTED_LOCALES_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `REDIRECT_URIS`
--
ALTER TABLE `REDIRECT_URIS`
  ADD CONSTRAINT `FK_1BURS8PB4OUJ97H5WUPPAHV9F` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

--
-- Constraints for table `REQUIRED_ACTION_PROVIDER`
--
ALTER TABLE `REQUIRED_ACTION_PROVIDER`
  ADD CONSTRAINT `FK_REQ_ACT_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `RESOURCE_ATTRIBUTE`
--
ALTER TABLE `RESOURCE_ATTRIBUTE`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU022KQEPOVBR` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`);

--
-- Constraints for table `RESOURCE_POLICY`
--
ALTER TABLE `RESOURCE_POLICY`
  ADD CONSTRAINT `FK_FRSRPOS53XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  ADD CONSTRAINT `FK_FRSRPP213XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`);

--
-- Constraints for table `RESOURCE_SCOPE`
--
ALTER TABLE `RESOURCE_SCOPE`
  ADD CONSTRAINT `FK_FRSRPOS13XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  ADD CONSTRAINT `FK_FRSRPS213XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`);

--
-- Constraints for table `RESOURCE_SERVER_PERM_TICKET`
--
ALTER TABLE `RESOURCE_SERVER_PERM_TICKET`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSPMT` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG83SSPMT` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`),
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG84SSPMT` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`),
  ADD CONSTRAINT `FK_FRSRPO2128CX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`);

--
-- Constraints for table `RESOURCE_SERVER_POLICY`
--
ALTER TABLE `RESOURCE_SERVER_POLICY`
  ADD CONSTRAINT `FK_FRSRPO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`);

--
-- Constraints for table `RESOURCE_SERVER_RESOURCE`
--
ALTER TABLE `RESOURCE_SERVER_RESOURCE`
  ADD CONSTRAINT `FK_FRSRHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`);

--
-- Constraints for table `RESOURCE_SERVER_SCOPE`
--
ALTER TABLE `RESOURCE_SERVER_SCOPE`
  ADD CONSTRAINT `FK_FRSRSO213XCX4WNKOG82SSRFY` FOREIGN KEY (`RESOURCE_SERVER_ID`) REFERENCES `RESOURCE_SERVER` (`ID`);

--
-- Constraints for table `RESOURCE_URIS`
--
ALTER TABLE `RESOURCE_URIS`
  ADD CONSTRAINT `FK_RESOURCE_SERVER_URIS` FOREIGN KEY (`RESOURCE_ID`) REFERENCES `RESOURCE_SERVER_RESOURCE` (`ID`);

--
-- Constraints for table `ROLE_ATTRIBUTE`
--
ALTER TABLE `ROLE_ATTRIBUTE`
  ADD CONSTRAINT `FK_ROLE_ATTRIBUTE_ID` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`);

--
-- Constraints for table `SCOPE_MAPPING`
--
ALTER TABLE `SCOPE_MAPPING`
  ADD CONSTRAINT `FK_OUSE064PLMLR732LXJCN1Q5F1` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`),
  ADD CONSTRAINT `FK_P3RH9GRKU11KQFRS4FLTT7RNQ` FOREIGN KEY (`ROLE_ID`) REFERENCES `KEYCLOAK_ROLE` (`ID`);

--
-- Constraints for table `SCOPE_POLICY`
--
ALTER TABLE `SCOPE_POLICY`
  ADD CONSTRAINT `FK_FRSRASP13XCX4WNKOG82SSRFY` FOREIGN KEY (`POLICY_ID`) REFERENCES `RESOURCE_SERVER_POLICY` (`ID`),
  ADD CONSTRAINT `FK_FRSRPASS3XCX4WNKOG82SSRFY` FOREIGN KEY (`SCOPE_ID`) REFERENCES `RESOURCE_SERVER_SCOPE` (`ID`);

--
-- Constraints for table `USER_ATTRIBUTE`
--
ALTER TABLE `USER_ATTRIBUTE`
  ADD CONSTRAINT `FK_5HRM2VLF9QL5FU043KQEPOVBR` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_CONSENT`
--
ALTER TABLE `USER_CONSENT`
  ADD CONSTRAINT `FK_GRNTCSNT_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_CONSENT_CLIENT_SCOPE`
--
ALTER TABLE `USER_CONSENT_CLIENT_SCOPE`
  ADD CONSTRAINT `FK_GRNTCSNT_CLSC_USC` FOREIGN KEY (`USER_CONSENT_ID`) REFERENCES `USER_CONSENT` (`ID`);

--
-- Constraints for table `USER_FEDERATION_CONFIG`
--
ALTER TABLE `USER_FEDERATION_CONFIG`
  ADD CONSTRAINT `FK_T13HPU1J94R2EBPEKR39X5EU5` FOREIGN KEY (`USER_FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`);

--
-- Constraints for table `USER_FEDERATION_MAPPER`
--
ALTER TABLE `USER_FEDERATION_MAPPER`
  ADD CONSTRAINT `FK_FEDMAPPERPM_FEDPRV` FOREIGN KEY (`FEDERATION_PROVIDER_ID`) REFERENCES `USER_FEDERATION_PROVIDER` (`ID`),
  ADD CONSTRAINT `FK_FEDMAPPERPM_REALM` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `USER_FEDERATION_MAPPER_CONFIG`
--
ALTER TABLE `USER_FEDERATION_MAPPER_CONFIG`
  ADD CONSTRAINT `FK_FEDMAPPER_CFG` FOREIGN KEY (`USER_FEDERATION_MAPPER_ID`) REFERENCES `USER_FEDERATION_MAPPER` (`ID`);

--
-- Constraints for table `USER_FEDERATION_PROVIDER`
--
ALTER TABLE `USER_FEDERATION_PROVIDER`
  ADD CONSTRAINT `FK_1FJ32F6PTOLW2QY60CD8N01E8` FOREIGN KEY (`REALM_ID`) REFERENCES `REALM` (`ID`);

--
-- Constraints for table `USER_GROUP_MEMBERSHIP`
--
ALTER TABLE `USER_GROUP_MEMBERSHIP`
  ADD CONSTRAINT `FK_USER_GROUP_USER` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_REQUIRED_ACTION`
--
ALTER TABLE `USER_REQUIRED_ACTION`
  ADD CONSTRAINT `FK_6QJ3W1JW9CVAFHE19BWSIUVMD` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_ROLE_MAPPING`
--
ALTER TABLE `USER_ROLE_MAPPING`
  ADD CONSTRAINT `FK_C4FQV34P1MBYLLOXANG7B1Q3L` FOREIGN KEY (`USER_ID`) REFERENCES `USER_ENTITY` (`ID`);

--
-- Constraints for table `USER_SESSION_NOTE`
--
ALTER TABLE `USER_SESSION_NOTE`
  ADD CONSTRAINT `FK5EDFB00FF51D3472` FOREIGN KEY (`USER_SESSION`) REFERENCES `USER_SESSION` (`ID`);

--
-- Constraints for table `WEB_ORIGINS`
--
ALTER TABLE `WEB_ORIGINS`
  ADD CONSTRAINT `FK_LOJPHO213XCX4WNKOG82SSRFY` FOREIGN KEY (`CLIENT_ID`) REFERENCES `CLIENT` (`ID`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
