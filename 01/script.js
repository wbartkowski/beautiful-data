var dataset = [18, 48, 14, 31, 23, 12, 38, 27, 12, 13, 21, 41, 8, 19, 43, 31, 46];

var svg = d3.select('body').append('svg').attr({
    width: window.innerWidth,
    height: window.innerHeight
});
console.log(dataset.length);

var heightScale = d3.scale.linear()
    .domain([0, d3.max(dataset)])
    .range([0, window.innerHeight]);

svg.selectAll('rect').data(dataset).enter().append('rect').attr({
    x: function (d, i) {
        return i * window.innerWidth / dataset.length;
    },
    y: function (d, i) {
        return window.innerHeight - heightScale(d);
    },
    width: window.innerWidth / dataset.length - 1,
    height: heightScale,
    fill: 'orange'
});