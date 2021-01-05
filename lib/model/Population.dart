
class Population {
  Population({
    this.year,
    this.population,
    this.yearlyChange,
    this.medianAge,
    this.fertility,
    this.density,
    this.libyaGRank,
    this.welcomePopulation,
  });

  int year;
  int population;
  int yearlyChange;
  double medianAge;
  double fertility;
  int density;
  int libyaGRank;
  int welcomePopulation;

  factory Population.fromJson(Map<String, dynamic> json) => Population(
    year: json["year"],
    population: json["Population"] == null ? null : json["Population"],
    yearlyChange: json["YearlyChange"],
    medianAge: json["MedianAge"].toDouble(),
    fertility: json["Fertility"].toDouble(),
    density: json["Density"],
    libyaGRank: json["LibyaGRank"],
    welcomePopulation: json["Population"] == null ? null : json["Population"],
  );
}