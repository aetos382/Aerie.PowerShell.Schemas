<?xml version="1.0" encoding="utf-8"?>
<sch:schema xmlns:sch="http://purl.oclc.org/dsdl/schematron" queryBinding="xslt2">
  
  <sch:pattern>
    
    <sch:rule context="//View">
      <sch:assert test="not(OutOfBand and GroupBy)">An Out Of Band view cannot have GroupBy.</sch:assert>
    </sch:rule>
    
    <sch:rule context="//View/OutOfBand">
      <sch:assert test="../ListControl or ../CustomControl">Out Of Band views can only have CustomControl or ListControl.</sch:assert>
    </sch:rule>
    
    <sch:rule context="//TableRowEntries">
      <sch:assert test="count(TableRowEntry[not(EntrySelectedBy)]) = 1">There must be exactly one default TableRowEntry.</sch:assert>
    </sch:rule>
    
    <sch:rule context="//ListEntries">
      <sch:assert test="count(ListEntry[not(EntrySelectedBy)]) = 1">There must be exactly one default ListEntry.</sch:assert>
    </sch:rule>    
    
    <sch:rule context="//WideEntries">
      <sch:assert test="count(WideEntry[not(EntrySelectedBy)]) = 1">There must be exactly one default WideEntry.</sch:assert>
    </sch:rule>    
    
    <sch:rule context="//CustomEntries">
      <sch:assert test="count(CustomEntry[not(EntrySelectedBy)]) = 1">There must be exactly one default ustomEntry.</sch:assert>
    </sch:rule>

    <sch:rule context="//TableHeaders">
      <sch:let name="header_item_count" value="count(TableColumnHeader)"/>
      <sch:let name="default_row_item_count" value="count(..//TableRowEntry[not(EntrySelectedBy)]//TableColumnItem)"/>
      
      <sch:assert test="$header_item_count = $default_row_item_count">The header item count = <sch:value-of select="$header_item_count"/> does not match default row item count = <sch:value-of select="$default_row_item_count"/>.</sch:assert>
    </sch:rule>

    <sch:rule context="//TableRowEntry[EntrySelectedBy]/TableColumnItems">
      <sch:let name="row_item_count" value="count(TableColumnItem)"/>
      <sch:let name="default_row_item_count" value="count(../../TableRowEntry[not(EntrySelectedBy)]//TableColumnItem)"/>
      <sch:let name="alt_row_entries_index" value="count(../preceding-sibling::TableRowEntry[EntrySelectedBy]) + 1"/>
      
      <sch:assert test="$row_item_count = $default_row_item_count">The row item count = <sch:value-of select="$row_item_count"/> on alternative set #<sch:value-of select="$alt_row_entries_index"/> does not match default row item count = <sch:value-of select="$default_row_item_count"/>.</sch:assert>
    </sch:rule>
    
  </sch:pattern>
  
</sch:schema>
