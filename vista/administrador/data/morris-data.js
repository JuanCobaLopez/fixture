$(function() {

    Morris.Area({
        element: 'morris-area-chart',
        data: [{
            periodo: '2014 Q1',
            escritorio: 2666,
            movil: null,
            otros: 2647
        }, {
            periodo: '2014 Q2',
            escritorio: 2778,
            movil: 2294,
            otros: 2441
        }, {
            periodo: '2014 Q3',
            escritorio: 4912,
            movil: 1969,
            otros: 2501
        }, {
            periodo: '2014 Q4',
            escritorio: 3767,
            movil: 3597,
            otros: 5689
        }, {
            periodo: '2015 Q1',
            escritorio: 6810,
            movil: 1914,
            otros: 2293
        }, {
            periodo: '2015 Q2',
            escritorio: 5670,
            movil: 4293,
            otros: 1881
        }, {
            periodo: '2015 Q3',
            escritorio: 4820,
            movil: 3795,
            otros: 1588
        }, {
            periodo: '2015 Q4',
            escritorio: 15073,
            movil: 5967,
            otros: 5175
        }, {
            periodo: '2016 Q1',
            escritorio: 10687,
            movil: 4460,
            otros: 2028
        }, {
            periodo: '2016 Q2',
            escritorio: 8432,
            movil: 5713,
            otros: 1791
        }],
        xkey: 'periodo',
        ykeys: ['escritorio', 'movil', 'otros'],
        labels: ['PC escritorio', 'Telf. Móvil', 'Otros dispositivos'],
        pointSize: 2,
        hideHover: 'auto',
        resize: true
    });

    Morris.Donut({
        element: 'morris-donut-chart',
        data: [{
            label: "Download Sales",
            value: 12
        }, {
            label: "In-Store Sales",
            value: 30
        }, {
            label: "Mail-Order Sales",
            value: 20
        }],
        resize: true
    });

    Morris.Bar({
        element: 'morris-bar-chart',
        data: [{
            y: '2006',
            a: 100,
            b: 90
        }, {
            y: '2007',
            a: 75,
            b: 65
        }, {
            y: '2008',
            a: 50,
            b: 40
        }, {
            y: '2009',
            a: 75,
            b: 65
        }, {
            y: '2010',
            a: 50,
            b: 40
        }, {
            y: '2011',
            a: 75,
            b: 65
        }, {
            y: '2012',
            a: 100,
            b: 90
        }],
        xkey: 'y',
        ykeys: ['a', 'b'],
        labels: ['Series A', 'Series B'],
        hideHover: 'auto',
        resize: true
    });
    
});
