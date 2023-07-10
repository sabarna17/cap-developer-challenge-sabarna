using { managed, cuid  } from '@sap/cds/common';

namespace golf;

entity Rounds : cuid, managed {
  title  : String(111);
  Holes  : Composition of many Holes;
}

entity Holes : cuid{
  holeid : Integer @assert.range: [1,18];
  par    : Integer @assert.range: [3,5];
  @Core.Computed
  @readonly  
  score  : Integer @assert.range: [1, 30];
  round  : Association to Rounds;
  Shots  : Composition of many Shots;
}

entity Shots : cuid  {
  hole          : Association to Holes;
  timeStart     : Timestamp @cds.on.insert : $now;
  timeEnd       : Timestamp @cds.on.insert : $now @cds.on.update : $now;
}