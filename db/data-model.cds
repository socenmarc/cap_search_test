using {
  Currency,
  managed,
  sap,
  cuid
} from '@sap/cds/common';

namespace sap.capire.bookshop;

@cds.search : {
  title,
  descr : false,
  author.name
}
entity Books : managed {
  key ID       : Integer;
      title    : localized String(111);
      descr    : localized String(1111);
      author   : Association to Authors;
      genre    : Association to Genres;
      stock    : Integer;
      price    : Decimal(9, 2);
      currency : Currency;
}

@assert.unique : {code : [code]}
entity Authors : managed, cuid {
  code  : Integer;
  name  : String(111);
  alias : String(10);
  books : Association to many Books
            on books.author = $self;
}

/**
 * Hierarchically organized Code List for Genres
 */
entity Genres : sap.common.CodeList {
  key ID       : Integer;
      parent   : Association to Genres;
      children : Composition of many Genres
                   on children.parent = $self;
}
