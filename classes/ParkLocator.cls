public class ParkLocator {
    public static string[] country(String country) {
        ParkService.ParksImplPort park = new ParkService.ParksImplPort();
        return park.byCountry(country);
    }
}