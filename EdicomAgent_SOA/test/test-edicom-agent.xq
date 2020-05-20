import module namespace csvtoxml = "http://www.sunpower.com/middleware/realtime/sunpower/agent/csvtoxml/xquery/1.0" at "../xquery/CSVtoXMLConversion.xq";
import module namespace ediQ_SOA="http://www.sunpower.com/middleware/realtime/edicom_soa/xquery/1.0" at "../xquery/Edicom_Agent.xq";

declare namespace das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd";
declare variable $gConfiguration_997 := doc('../config/gConfiguration_997.xml')/*/.;
declare variable $gConfiguration_214 := doc('../config/gConfiguration_214.xml')/*/.;
declare variable $gConfiguration_204 := doc('../config/gConfiguration_204_out.xml')/*/.;
declare variable $gConfiguration_846 := doc('../config/gConfiguration_846.xml')/*/.;
declare variable $gConfiguration_861 := doc('../config/gConfiguration_861.xml')/*/.;

declare variable $csvinput997 :=  doc('../sample-data/CopyOf997_CSV.xml')/*/.;

declare variable $csvinput214 :=  doc('../sample-data/EDI_214.xml')/*/.;

declare variable $csvinput846 :=  doc('../sample-data/EDI_846.xml')/*/.;

declare variable $csvinput861 :=  doc('../sample-data/EDI_861.xml')/*/.;

declare variable $edi888xml :=  doc('../sample-data/EDI888.xml')/*/.;

declare variable $edi204xml :=  doc('../sample-data/EDI_204.xml')/*/.;

declare variable $das_edi204xml :=  doc('../sample-data/DASEDI_204.xml')/*/.;

declare variable $edi997xml :=  doc('../sample-data/EDI_997XML.xml')/*/.;
declare variable $edi214xml :=  doc('../sample-data/EDI214XML.xml')/*/.;
declare variable $edi846xml :=  doc('../sample-data/EDI846CSV2XML.xml')/*/.;
declare variable $edi861xml :=  doc('../sample-data/EDI_861XML.xml')/*/.;

 declare function local:prepare997XML()
 {
  csvtoxml:convert997CSVtoXML($csvinput997,<EDI997/>)
 };
 
declare function local:insert997XML()
{
    ediQ_SOA:prepareDASRequestForEdicom997($gConfiguration_997,$edi997xml,'SAMPLE997.csv')
};
  
  
  declare function local:insert214XML()
{
    ediQ_SOA:prepareDASRequestForEdicom214($gConfiguration_214, $edi214xml,'SAMPLE214.csv')
  };
  
  
  declare function local:insert846XML()
{
    ediQ_SOA:prepareDASRequestForEdicom846($gConfiguration_846,$edi846xml,2345678,'12345678','SAMPLE846.csv')
  };
  
  
    declare function local:insert861XML()
{
    ediQ_SOA:prepareDASRequestForEdicom861($gConfiguration_861,$edi861xml,2345678,'12345678','SAMPLE861.csv')
  };
  
  
  declare function local:prepare214XML()
 {
  csvtoxml:convert214CSVtoXML($csvinput214,<EDI214/>,$gConfiguration_214)
 };
  
  declare function local:prepare861XML()
 {
  csvtoxml:convert861CSVtoXML($csvinput861,<EDI861/>,$gConfiguration_861)
 };
 
  
  declare function local:prepare846XML()
 {
  csvtoxml:convert846CSVtoXML($csvinput846,<EDI846/>,$gConfiguration_846)
 };
 
 declare function local:prepareWS204()
 {
  ediQ_SOA:prepareWSInputFor204($das_edi204xml,$gConfiguration_204)
 };
 
 local:prepare846XML()
  (:local:prepare861XML():)   
   (:local:prepare997XML():)
   (:local:prepare214XML():)
  
    (:local:prepareWS204XML():)  
    (:local:prepareWS204():)
       
           
     (:local:insert214XML():)
       (:local:insert997XML():)     
       (:local:insert846XML():)
    (:local:insert861XML():)
      
      