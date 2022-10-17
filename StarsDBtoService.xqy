xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns2="http://www.example.org";
(:: import schema at "../Schemas/FIWrapperServiceDemoSchema.xsd" ::)
declare namespace ns1="http://xmlns.oracle.com/pcbpel/adapter/db/sp/STARS_FIWrapperDemoDBAdapterBS";
(:: import schema at "../STARS_FIWrapperDemoDBAdapterBS_sp.xsd" ::)

declare variable $Response as element() (:: schema-element(ns1:OutputParameters) ::) external;

declare function local:func($Response as element() (:: schema-element(ns1:OutputParameters) ::)) as element() (:: schema-element(ns2:WrapperServiceDemoResponse) ::) {
    <ns2:WrapperServiceDemoResponse>
        <ns2:StatusMessage>{fn:data($Response/ns1:X_STATUS_MESSAGE)}</ns2:StatusMessage>
        <ns2:StatusCode>{fn:data($Response/ns1:X_STATUS_CODE)}</ns2:StatusCode>
        {
            for $X_FI_MANAGER_TBL_ITEM in $Response/ns1:X_FI_MANAGER_TBL/ns1:X_FI_MANAGER_TBL_ITEM
            return 
            <ns2:FIManagerTbl></ns2:FIManagerTbl>
        }
    </ns2:WrapperServiceDemoResponse>
};

local:func($Response)
