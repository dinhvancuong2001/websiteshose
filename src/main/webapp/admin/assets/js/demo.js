



// monthlyChart

Chartist.Pie(
  "#monthlyChart",
  {
    labels: ["50%", "20%", "30%"],
    series: [50, 20, 30],
  },
  {
    plugins: [Chartist.plugins.tooltip()],
  }
);

// trafficChart
var chart = new Chartist.Line(
  "#trafficChart",
  {
    labels: [1, 2, 3, 4, 5, 6, 7],
    series: [
      [5, 9, 7, 8, 5, 3, 5],
      [6, 9, 5, 10, 2, 3, 7],
      [2, 7, 4, 10, 7, 6, 2],
    ],
  },
  {
    plugins: [Chartist.plugins.tooltip()],
    low: 0,
    height: "245px",
  }
);

// salesChart




$(".mapcontainer").mapael({
  map: {
    name: "world_countries",
    zoom: {
      enabled: true,
      maxLevel: 10,
    },
    defaultPlot: {
      attrs: {
        fill: "#004a9b",
        opacity: 0.6,
      },
    },
    defaultArea: {
      attrs: {
        fill: "#e4e4e4",
        stroke: "#fafafa",
      },
      attrsHover: {
        fill: "#59d05d",
      },
      text: {
        attrs: {
          fill: "#505444",
        },
        attrsHover: {
          fill: "#000",
        },
      },
    },
  },
  areas: {
    // "department-56": {
    // 	text: {content: "Morbihan", attrs: {"font-size": 10}},
    // 	tooltip: {content: "<b>Morbihan</b> <br /> Bretagne"}
    // },
    ID: {
      tooltip: { content: "<b>Indonesia</b> <br /> Tempat Lahir Beta" },
      attrs: {
        fill: "#59d05d",
      },
      attrsHover: {
        fill: "#59d05d",
      },
    },
    RU: {
      tooltip: { content: "<b>Russia</b>" },
      attrs: {
        fill: "#59d05d",
      },
      attrsHover: {
        fill: "#59d05d",
      },
    },
    US: {
      tooltip: { content: "<b>United State</b>" },
      attrs: {
        fill: "#59d05d",
      },
      attrsHover: {
        fill: "#59d05d",
      },
    },
    AU: {
      tooltip: { content: "<b>Australia</b>" },
      attrs: {
        fill: "#59d05d",
      },
      attrsHover: {
        fill: "#59d05d",
      },
    },
  },
});
