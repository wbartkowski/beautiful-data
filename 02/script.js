var dataset = [18, 50, 14, 31, 23, 12, 38, 27, 11, 13, 21, 41, 8, 19, 43, 31, 46];

var width = window.innerWidth,
    height = window.innerHeight,
    margin = 30;

var svg = d3.select('body').append('svg').attr({
    width: width,
    height: height
});
console.log(dataset.length);

var heightScale = d3.scale.linear()
    .domain([0, d3.max(dataset)])
    .range([window.innerHeight - margin * 2, 0]);

svg.selectAll('rect').data(dataset).enter().append('rect').attr({
    x: function (d, i) {
        return margin + i * (window.innerWidth - margin * 2) / dataset.length;
    },
    y: function (d, i) {
        return heightScale(d) + margin;
    },
    width: (window.innerWidth - margin * 2) / dataset.length - 1,
    height: function (d, i) {
        return height - heightScale(d) - margin * 2;
    },
    fill: 'orange'
});
var y_axis = d3.svg.axis().scale(heightScale).orient('left');

d3.select('svg')
    .append('g')
    .attr('class', 'y axis')
    .attr('transform', 'translate(' + margin + ',' + margin + ')')
    .call(y_axis);