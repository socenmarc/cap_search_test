annotate CatalogService.Authors with @(
  UI: {
    SelectionFields: [ alias ],
    LineItem: [
      {Value: name, Label:'{i18n>Name}'},
      {Value: alias, Label:'{i18n>Alias}'}
    ]
  }
);