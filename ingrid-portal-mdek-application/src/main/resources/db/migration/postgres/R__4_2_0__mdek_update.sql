UPDATE info SET value_name = '4.2.0' WHERE  info.key_name = 'version';

DELETE FROM help_messages WHERE gui_id >= 5300 AND gui_id <= 5314;

INSERT INTO help_messages (id, version, gui_id, entity_class, language, name, help_text, sample) VALUES
(1640, 0, 5300, -1, 'de', 'Raster/Gridformat', '', ''),
(1641, 0, 5300, -1, 'en', 'Grid format', '', ''),
(1642, 0, 5301, -1, 'de', 'Verfügbarkeit von Transformationsparametern', '', ''),
(1643, 0, 5301, -1, 'en', 'Availability of the transformation parameter', '', ''),
(1644, 0, 5302, -1, 'de', 'Anzahl der Dimensionen', '', ''),
(1645, 0, 5302, -1, 'en', 'Number of dimensions', '', ''),
(1646, 0, 5303, -1, 'de', 'Achsenbezeichnung', '', ''),
(1647, 0, 5303, -1, 'en', 'Description of axis', '', ''),
(1648, 0, 5304, -1, 'de', 'Elementanzahl', '', ''),
(1649, 0, 5304, -1, 'en', 'Number of elements', '', ''),
(1650, 0, 5305, -1, 'de', 'Zellengeometrie', '', ''),
(1651, 0, 5305, -1, 'en', 'Cell geometrie', '', ''),
(1652, 0, 5306, -1, 'de', 'Georektifiziertes Raster', 'Raster, dessen Zellen gleicher Größe in den Einheiten ihres räumlichen Bezugssystems - geografisches Referenzsystem (Länge/Breite) oder Einheiten der Kartenprojektion - regelmäßig angeordnet sind, so dass jede Zelle durch ihre Rasterkoordinate, sowie den Ursprung, die Zellenbreite und Orientierung des Rasters geolokalisiert werden kann.', ''),
(1653, 0, 5306, -1, 'en', 'Geo rectified grid', 'Grid, whose cells of the same size are regularly arranged in the units of their spatial reference system - geographical reference system (length / width) or units of the map projection - so that each cell can be geolocalized by its grid coordinates as well as the origin, cell width and orientation of the grid.', ''),
(1654, 0, 5307, -1, 'de', 'Georeferenzierbares Raster', 'Raster, dessen Zellen in Bezug auf ein geografisches Koordinatensystem oder ein Kartenprojektionssystem unregelmäßig groß sind, so dass die einzelnen Zellen nur durch Geolokalisierungsinformationen, nicht aber allein aus der Lage des Rasters lokalisiert werden können.', ''),
(1655, 0, 5307, -1, 'en', 'Geo referenced grid', 'Grid whose cells are irregularly large with respect to a geographic coordinate system or a map projection system so that the individual cells can be located only by geolocation information, but not by the location of the grid alone.', ''),
(1656, 0, 5308, -1, 'de', 'Kontrollpunktverfügbarkeit', 'Aussage, ob Kontrollpunkte vorhanden sind, um die Genauigkeit der Georeferenzierung des Rasters zu überprüfen.', ''),
(1657, 0, 5308, -1, 'en', 'Checkpoint availability', 'Statement whether control points are present to check the accuracy of the georeferencing of the grid.', ''),
(1658, 0, 5309, -1, 'de', 'Kontrollpunktbeschreibung', 'Beschreibung der Kontrollpunkte für die Überprüfung der Genauigkeit der Georeferenzierung des Rasters.', ''),
(1659, 0, 5309, -1, 'en', 'Checkpoint description', 'Description of the control points for the verification of the accuracy of the georeferencing of the grid.', ''),
(1660, 0, 5310, -1, 'de', 'Eckpunkte', 'Bezug des Rasterkoordinatensystems zur Erde, der durch die vier Eckpunkt-Zellen des Rasters und die entsprechenden Koordinaten im räumlichen Bezugssystem definiert ist. Von den vier Eckpunkten des Rasters werden mindestens zwei diagonal gegenüberliegende Eckpunkte benötigt. Der erste Eckpunkt der anzugebenden Sequenz entspricht dem Ursprung des Rasters.', ''),
(1661, 0, 5310, -1, 'en', 'Corner point', 'Relation of the grid coordinate system to Earth, which is defined by the four corner points and the coordinates of the grid. From the four corner points of the grid, at least two diagonally opposite corner points are needed. The first corner point of the sequence corresponds to the origin of the grid.', ''),
(1662, 0, 5311, -1, 'de', 'Punkt im Pixel', 'Punkt im Pixel, an welchem der Bezug zur Erde besteht.', ''),
(1663, 0, 5311, -1, 'en', 'Point in pixel', 'Point in pixel which is in relation to Earth.', ''),
(1664, 0, 5312, -1, 'de', 'Verfügbarkeit der Orientierungsparameter', 'Angabe, ob Orientierungsparameter verfügbar sind.', ''),
(1665, 0, 5312, -1, 'en', 'Availability of the orientation parameter', 'Determines if orientation parameter exists.', ''),
(1666, 0, 5313, -1, 'de', 'Passpunktverfügbarkeit', 'Angabe, ob Passpunkte existieren.', ''),
(1667, 0, 5313, -1, 'en', 'Control point availability', 'Determines, if control point exists.', ''),
(1668, 0, 5314, -1, 'de', 'Georeferenzierungsparameter', 'Parameter, die die Georeferenzierung der Rasterdaten ermöglichen', ''),
(1669, 0, 5314, -1, 'en', 'Geo referenced parameter', 'Parameter, to allow geo references for the grid.', '');