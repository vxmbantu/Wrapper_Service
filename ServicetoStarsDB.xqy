xquery version "1.0" encoding "utf-8";

(:: OracleAnnotationVersion "1.0" ::)

declare namespace ns1="http://www.example.org";
(:: import schema at "../Schemas/FIWrapperServiceDemoSchema.xsd" ::)
declare namespace ns2="http://xmlns.oracle.com/pcbpel/adapter/db/sp/STARS_FIWrapperDemoDBAdapterBS";
(:: import schema at "../STARS_FIWrapperDemoDBAdapterBS_sp.xsd" ::)

declare variable $Request as element() (:: schema-element(ns1:WrapperServiceDemoRequest) ::) external;

declare function local:func($Request as element() (:: schema-element(ns1:WrapperServiceDemoRequest) ::)) as element() (:: schema-element(ns2:InputParameters) ::) {
    <ns2:InputParameters>
        <ns2:P_DEALER_CODE>{fn:data($Request/ns1:DealerCode)}</ns2:P_DEALER_CODE>
    </ns2:InputParameters>
};

local:func($Request)
