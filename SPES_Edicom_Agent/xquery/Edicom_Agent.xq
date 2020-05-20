module namespace ediQ='http://www.sunpower.com/middleware/realtime/edicom/xquery/1.0';
import module namespace functx = "http://www.common.functx.com" at "../../Edicom_Common/xquery/functx-xquery-functions.xq";

declare namespace das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd";

 
 declare function ediQ:prepareDASRequestForEdicom947 ($configuration as node(),$gHeader as node(),$gHeaderId as xs:integer,$gProcessId as xs:string,$gFileName as xs:string?)
{
 
 
 <das:multiDataAccessRequest xmlns:das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd">
     {
      ediQ:prepareHeaderSQLFor947($configuration,$gHeader,$gHeaderId,$gProcessId,$gFileName)
     }
     { 
    
      let $line_items :=   for $line_item_counter in 1 to count($gHeader/LINE_ITEMS/LINE_ITEM)                    
         return   ediQ:prepareLineItemSQLFor947($configuration,$gHeader/LINE_ITEMS/LINE_ITEM[$line_item_counter],$gHeaderId,$gProcessId,$line_item_counter)/*
      return  $line_items      
    }
</das:multiDataAccessRequest>
};


declare function ediQ:prepareHeaderSQLFor947($configuration,$gHeader,$gHeaderId,$gProcessId,$gFileName) 
{
 let $baseSql :=$configuration/Edicom[@resource='947']/data-mapping/table[@name='header']/sql-statement/text()
 let $columnNameSequence :=for $element in $gHeader/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='header']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gFileName')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),$gFileName) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     <das:sqlStatement columnCase="lowercase"
                         hasResultSet="false"
                         includeMetadata="false"
                         maxRows="0"
                         maxWaitSeconds="0"
                         statementId="edicom947-Header">
          <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='header']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='header']/column[@target=$column]/@dataType)  
                    let $element :=   $gHeader/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
    </das:sqlStatement>
  
};

declare function ediQ:prepareLineItemSQLFor947($configuration,$line_item,$gHeaderId,$gProcessId,$gLineId) 
{
 let $baseSql :=$configuration/Edicom[@resource='947']/data-mapping/table[@name='line_item']/sql-statement/text()
 let $columnNameSequence :=for $element in $line_item/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='line_item']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gLineId')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),string($gLineId)) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     <Line_Item>
              
             <das:sqlStatement columnCase="lowercase"
                                 hasResultSet="false"
                                 includeMetadata="false"
                                 maxRows="0"
                                 maxWaitSeconds="0"
                                 statementId="edicom947-LineItem">
                    <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='line_item']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='line_item']/column[@target=$column]/@dataType)  
                    let $element :=   $line_item/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
              </das:sqlStatement>
                 
            {
               
                let $serial_line_items :=   for $serial_line_item_counter in 1 to count($line_item/SERIAL_LINE_ITEMS/SERIAL_LINE_ITEM)         
                return        
                    ediQ:prepareSerialLineItemSQLFor947($configuration,$line_item/SERIAL_LINE_ITEMS/SERIAL_LINE_ITEM[$serial_line_item_counter],$gHeaderId,$gProcessId,$gLineId,$serial_line_item_counter)
                return  $serial_line_items    
           }
          </Line_Item> 
  
};

declare function ediQ:prepareSerialLineItemSQLFor947 ($configuration as node(),$serial_line_item as node(),$gHeaderId as xs:integer,$gProcessId as xs:string,$gLineId as xs:integer,$gLineSerialId as xs:integer)
{
 let $baseSql :=$configuration/Edicom[@resource='947']/data-mapping/table[@name='line_serial_item']/sql-statement/text()
 let $columnNameSequence :=for $element in $serial_line_item/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='line_serial_item']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gLineId','gLineSerialId')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),string($gLineId),string($gLineSerialId)) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 
 return
 
              
             <das:sqlStatement columnCase="lowercase"
                                 hasResultSet="false"
                                 includeMetadata="false"
                                 maxRows="0"
                                 maxWaitSeconds="0"
                                 statementId="edicom947-SerailLineItem">
                   <das:statement>{$sqlStatement }</das:statement>
                      
                       {
                        for $column in $columnNameSequence
                    
                            let $source :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='line_serial_item']/column[@target=$column]/@source)
                            let $dataType :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='line_serial_item']/column[@target=$column]/@dataType)  
                            let $element :=   $serial_line_item/saxon:evaluate($source)   
                            where exists( $element/text())
                        return     
                        <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
                 
            </das:sqlStatement>
           
};

declare function ediQ:prepareWSInputFor940($gdataAccessResponse as node(),$gConfiguration as node())
{
 
      let $header_mapping :=$gConfiguration/Edicom[@resource='940']/data-mapping/table[@name='header']
      let $line_item_mapping :=$gConfiguration/Edicom[@resource='940']/data-mapping/table[@name='line_item']
      return
             <HEADERS>
              
                {
                  for $eachControlNumber in distinct-values($gdataAccessResponse/das:row//CONTROL_NUMBER)
                   return
                    <HEADER>
                      {
                       for $parameter in $header_mapping/column
                           let $source:=data($parameter/@source)
                           let $target :=data($parameter/@target)
                           let $value :=distinct-values($gdataAccessResponse/das:row[CONTROL_NUMBER/text()=$eachControlNumber]/saxon:evaluate($source)/text())
                       return     
                           element {$target} {$value}
                      }
                      {
                       <LINE_ITEMS>
                         {
                          for $line_item in $gdataAccessResponse/das:row[CONTROL_NUMBER/text()=$eachControlNumber]
                           return 
                            <LINE_ITEM>
                             { 
                               for $parameter in $line_item_mapping/column
                                   let $source:=data($parameter/@source)
                                   let $target :=data($parameter/@target)
                                   let $value :=$line_item/saxon:evaluate($source)/text()
                               return     
                                    element {$target} {$value}}
                            </LINE_ITEM>
                         }
                       </LINE_ITEMS>       
                      }  
                   </HEADER>
                }    
             </HEADERS>
};

declare function ediQ:prepareDASRequestForEdicom945 ($configuration as node(),$gHeader as node(),$gHeaderId as xs:integer,$gProcessId as xs:string,$gFileName as xs:string?)
{
 
 
 <das:multiDataAccessRequest xmlns:das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd">
     {
      ediQ:prepareHeaderSQLFor945($configuration,$gHeader,$gHeaderId,$gProcessId,$gFileName)
     }
     { 
    
      let $license_plates :=   for $license_plate_counter in 1 to count($gHeader/LICENCE_PLATES/LICENCE_PLATE)                    
         return   ediQ:prepareLicensePlateSQLFor945($configuration,$gHeader/LICENCE_PLATES/LICENCE_PLATE[$license_plate_counter],$gHeaderId,$gProcessId,$license_plate_counter)/*
      return  $license_plates      
    }
</das:multiDataAccessRequest>
};

declare function ediQ:prepareHeaderSQLFor945($configuration,$gHeader,$gHeaderId,$gProcessId,$gFileName) 
{
 let $baseSql :=$configuration/Edicom[@resource='945']/data-mapping/table[@name='header']/sql-statement/text()
 let $columnNameSequence :=for $element in $gHeader/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='header']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gFileName')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),$gFileName) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     <das:sqlStatement columnCase="lowercase"
                         hasResultSet="false"
                         includeMetadata="false"
                         maxRows="0"
                         maxWaitSeconds="0"
                         statementId="edicom945-Header">
          <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='header']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='header']/column[@target=$column]/@dataType)  
                    let $element :=   $gHeader/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
    </das:sqlStatement>
  
};

declare function ediQ:prepareLicensePlateSQLFor945 ($configuration,$license_plate,$gHeaderId,$gProcessId,$gLPNId)
{

 let $columnNameSequence :=for $element in $license_plate/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='license_plate']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gLPNId')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),string($gLPNId)) 
 
  let $baseSql :=  if (string-length($columnNames)>1) then 
                    $configuration/Edicom[@resource='945']/data-mapping/table[@name='license_plate']/sql-statement/text()
                    else  $configuration/Edicom[@resource='945']/data-mapping/table[@name='license_plate']/static_sql_statement/text()
                    return
 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
   <License_Plate>
    <das:sqlStatement columnCase="lowercase"
                                 hasResultSet="false"
                                 includeMetadata="false"
                                 maxRows="0"
                                 maxWaitSeconds="0"
                                 statementId="edicom945-LicensePlate">
                    <das:statement>{$sqlStatement}  </das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='license_plate']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='947']/data-mapping/table[@name='license_plate']/column[@target=$column]/@dataType)  
                    let $element :=   $license_plate/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
     </das:sqlStatement>
     {
       let $line_items :=   for $line_item_counter in 1 to count($license_plate/LINE_ITEMS/LINE_ITEM)                    
         return   ediQ:prepareLineItemSQLFor945($configuration,$license_plate/LINE_ITEMS/LINE_ITEM[$line_item_counter],$gHeaderId,$gLPNId,$gProcessId,$line_item_counter)/*
       return  $line_items
     }
   </License_Plate>
};

declare function ediQ:prepareLineItemSQLFor945($configuration,$line_item,$gHeaderId,$gLPNId,$gProcessId,$gLineId) 
{
 let $baseSql :=$configuration/Edicom[@resource='945']/data-mapping/table[@name='line_item']/sql-statement/text()
 let $columnNameSequence :=for $element in $line_item/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='line_item']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gLPNId','gProcessId','gLineId')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gLPNId),string($gProcessId),string($gLineId)) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     <Line_Item>
              
             <das:sqlStatement columnCase="lowercase"
                                 hasResultSet="false"
                                 includeMetadata="false"
                                 maxRows="0"
                                 maxWaitSeconds="0"
                                 statementId="edicom945-LineItem">
                    <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='line_item']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='line_item']/column[@target=$column]/@dataType)  
                    let $element :=   $line_item/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
              </das:sqlStatement>
                 
            {
               
                let $serial_line_items :=   for $serial_line_item_counter in 1 to count($line_item/SERIAL_LINE_ITEMS/SERIAL_LINE_ITEM)         
                return        
                    ediQ:prepareSerialLineItemSQLFor945($configuration,$line_item/SERIAL_LINE_ITEMS/SERIAL_LINE_ITEM[$serial_line_item_counter],$gHeaderId,$gProcessId,$gLPNId,$gLineId,$serial_line_item_counter)
                return  $serial_line_items    
           }
          </Line_Item> 
  
};


declare function ediQ:prepareSerialLineItemSQLFor945 ($configuration as node(),$serial_line_item as node(),$gHeaderId as xs:integer,$gProcessId as xs:string,$gLPNId as xs:integer,$gLineId as xs:integer,$gLineSerialId as xs:integer)
{
 let $baseSql :=$configuration/Edicom[@resource='945']/data-mapping/table[@name='line_serial_item']/sql-statement/text()
 let $columnNameSequence :=for $element in $serial_line_item/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='line_serial_item']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gLPNId','gProcessId','gLineId','gLineSerialId')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gLPNId),string($gProcessId),string($gLineId),string($gLineSerialId)) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 
 return
 
              
             <das:sqlStatement columnCase="lowercase"
                                 hasResultSet="false"
                                 includeMetadata="false"
                                 maxRows="0"
                                 maxWaitSeconds="0"
                                 statementId="edicom945-SerailLineItem">
                   <das:statement>{$sqlStatement }</das:statement>
                      
                       {
                        for $column in $columnNameSequence
                    
                            let $source :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='line_serial_item']/column[@target=$column]/@source)
                            let $dataType :=data($configuration/Edicom[@resource='945']/data-mapping/table[@name='line_serial_item']/column[@target=$column]/@dataType)  
                            let $element :=   $serial_line_item/saxon:evaluate($source)   
                            where exists( $element/text())
                        return     
                        <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
                 
            </das:sqlStatement>
           
};

(: ---------------------- This section is for EDI 204 mappings----------------------------------------- :)

declare function ediQ:prepareDASRequestForEdicom204 ($configuration as node(),$gHeader as node(),$gHeaderId as xs:integer,$gProcessId as xs:string,$gFileName as xs:string?)
{
 
 
 <das:multiDataAccessRequest xmlns:das="http://schemas.active-endpoints.com/data-access/2010/04/data-access.xsd">
     {
      ediQ:prepareHeaderSQLFor204($configuration,$gHeader,$gHeaderId,$gProcessId,$gFileName)
     }
     { 
    
      let $line_items :=   for $line_item_counter in 1 to count($gHeader/LINE_ITEMS/LINE_ITEM)                    
         return   ediQ:prepareLineItemSQLFor204($configuration,$gHeader/LINE_ITEMS/LINE_ITEM[$line_item_counter],$gHeaderId,$gProcessId,$line_item_counter)/*
      return  $line_items      
    }
</das:multiDataAccessRequest>
};


declare function ediQ:prepareHeaderSQLFor204($configuration,$gHeader,$gHeaderId,$gProcessId,$gFileName) 
{
 let $baseSql :=$configuration/Edicom[@resource='204']/data-mapping/table[@name='header']/sql-statement/text()
 let $columnNameSequence :=for $element in $gHeader/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='204']/data-mapping/table[@name='header']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gFileName')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),$gFileName) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     <das:sqlStatement columnCase="lowercase"
                         hasResultSet="false"
                         includeMetadata="false"
                         maxRows="0"
                         maxWaitSeconds="0"
                         statementId="edicom204-Header">
          <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='204']/data-mapping/table[@name='header']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='204']/data-mapping/table[@name='header']/column[@target=$column]/@dataType)  
                    let $element :=   $gHeader/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
    </das:sqlStatement>
  
};

declare function ediQ:prepareLineItemSQLFor204($configuration,$line_item,$gHeaderId,$gProcessId,$gLineId) 
{
 let $baseSql :=$configuration/Edicom[@resource='204']/data-mapping/table[@name='line_item']/sql-statement/text()
 let $columnNameSequence :=for $element in $line_item/node()
        let $elementName :=local-name($element)
        let $target :=data($configuration/Edicom[@resource='204']/data-mapping/table[@name='line_item']/column[@source=$elementName]/@target)       
        where exists( $element/text()) and $target !=''
      return $target
 let $valuesSequence :=for $element in $columnNameSequence
                        return '?'         
  
 let $columnNames :=string-join($columnNameSequence,',')
 let $values :=string-join($valuesSequence,',')
 let $fromSql := ('columnName','values','gHeaderId','gProcessId','gLineId')
 let $toSql :=   ($columnNames,$values,string($gHeaderId),string($gProcessId),string($gLineId)) 
 let $sqlStatement :=  functx:replace-multi($baseSql ,$fromSql,$toSql) 
 return 
     <Line_Item>
              
             <das:sqlStatement columnCase="lowercase"
                                 hasResultSet="false"
                                 includeMetadata="false"
                                 maxRows="0"
                                 maxWaitSeconds="0"
                                 statementId="edicom204-LineItem">
                    <das:statement>{$sqlStatement}</das:statement>
              
              {
                for $column in $columnNameSequence
                    
                    let $source :=data($configuration/Edicom[@resource='204']/data-mapping/table[@name='line_item']/column[@target=$column]/@source)
                    let $dataType :=data($configuration/Edicom[@resource='204']/data-mapping/table[@name='line_item']/column[@target=$column]/@dataType)  
                    let $element :=   $line_item/saxon:evaluate($source)   
                    where exists( $element/text())
                return     
               <das:parameter sqlType="{$dataType}">{$element/text()}</das:parameter>
              }
              </das:sqlStatement>                
            
          </Line_Item> 
  
};
