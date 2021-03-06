// German

jQuery.extend( jQuery.fn.pickadate.defaults, {
    monthsFull: [ 'Januar', 'Februar', 'März', 'April', 'Mai', 'Juni', 'Juli', 'August', 'September', 'Oktober', 'November', 'Dezember' ],
    monthsShort: [ 'Jan', 'Feb', 'Mär', 'Apr', 'Mai', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dez' ],
    weekdaysFull: [ 'Sonntag', 'Montag', 'Dienstag', 'Mittwoch', 'Donnerstag', 'Freitag', 'Samstag' ],
    weekdaysShort: [ 'So', 'Mo', 'Di', 'Mi', 'Do', 'Fr', 'Sa' ],
    today: 'Heute',
    clear: 'Löschen',
    close: 'Schließen',
    firstDay: 1,
    format: 'ddd, dd. mmm yyyy',
    formatSubmit: 'dd.mm.yyyy',
    selectMonths: true,
    selectYears: 3000,
    min: new Date(1200,0,1),
    max: true
});

/*
jQuery.extend( jQuery.fn.pickatime.defaults, {
    clear: 'Löschen'
});
*/
