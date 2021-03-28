// ISO 4017 — Hexagon head screws — Product grades A and B
//
// d = basic major diameter (nominal diameter) of thread
// l = nominal length
//
// β = angle of the chamfer (hexagon head)

include <MCAD/units/metric.scad>
include <MCAD/general/constants.scad>
include <MCAD/fasteners/threads.scad>

$fn = 36;

module iso_hexagon_head_screw(diameter, length, grade = "A", tolerance = false)
{
	dimensions = iso_hexagon_head_screw_dimensions(diameter);
	hex_side_nom = dimensions[18] / mcad_const_sqrt3;
	hex_side_grade_a = dimensions[19] / mcad_const_sqrt3;
	hex_side_grade_b = dimensions[20] / mcad_const_sqrt3;

	echo(dimensions);
	echo(dimensions[8] / 2, hex_side_nom);

	if (grade == "A")
	{
		if (tolerance)
		{
			// Use minimum dimensions
			linear_extrude(height = dimensions[12])
			{
				polygon(points = [
					[0, dimensions[8] / 2],
					[dimensions[19] / 2, hex_side_grade_a / 2],
					[dimensions[19] / 2, -hex_side_grade_a / 2],
					[0, -dimensions[8] / 2],
					[-dimensions[19] / 2, -hex_side_grade_a / 2],
					[-dimensions[19] / 2, hex_side_grade_a / 2]
					],
					paths = [[0,1,2,3,4,5]]
				);
			}
			// Ghost in maximum dimensions
			%linear_extrude(height = dimensions[11])
			{
				polygon(points = [
					[0, hex_side_nom],
					[dimensions[18] / 2, hex_side_nom / 2],
					[dimensions[18] / 2, -hex_side_nom / 2],
					[0, -hex_side_nom],
					[-dimensions[18] / 2, -hex_side_nom / 2],
					[-dimensions[18] / 2, hex_side_nom / 2]
					],
					paths = [[0,1,2,3,4,5]]
				);
			}
		}
		// Use nominal dimensions
		else
		{
			linear_extrude(height = dimensions[10])
			{
				polygon(points = [
					[0, hex_side_nom],
					[dimensions[18] / 2, hex_side_nom / 2],
					[dimensions[18] / 2, -hex_side_nom / 2],
					[0, -hex_side_nom],
					[-dimensions[18] / 2, -hex_side_nom / 2],
					[-dimensions[18] / 2, hex_side_nom / 2]
					],
					paths = [[0,1,2,3,4,5]]
				);
			}
		}
	}
	else if (grade == "B")
	{
		if (tolerance)
		{
			// Use minimum dimensions
			linear_extrude(height = dimensions[14])
			{
				polygon(points = [
					[0, dimensions[9] / 2],
					[dimensions[20] / 2, hex_side_grade_b / 2],
					[dimensions[20] / 2, -hex_side_grade_b / 2],
					[0, -dimensions[9] / 2],
					[-dimensions[20] / 2, -hex_side_grade_b / 2],
					[-dimensions[20] / 2, hex_side_grade_b / 2]
					],
					paths = [[0,1,2,3,4,5]]
				);
			}
			// Ghost in nominal/maximum dimensions
			%linear_extrude(height = dimensions[13])
			{
				polygon(points = [
					[0, hex_side_nom],
					[dimensions[18] / 2, hex_side_nom / 2],
					[dimensions[18] / 2, -hex_side_nom / 2],
					[0, -hex_side_nom],
					[-dimensions[18] / 2, -hex_side_nom / 2],
					[-dimensions[18] / 2, hex_side_nom / 2]
					],
					paths = [[0,1,2,3,4,5]]
				);
			}
		}
		// Use nominal dimensions
		else
		{
			linear_extrude(height = dimensions[10])
			{
				polygon(points = [
					[0, hex_side_nom],
					[dimensions[18] / 2, hex_side_nom / 2],
					[dimensions[18] / 2, -hex_side_nom / 2],
					[0, -hex_side_nom],
					[-dimensions[18] / 2, -hex_side_nom / 2],
					[-dimensions[18] / 2, hex_side_nom / 2]
					],
					paths = [[0,1,2,3,4,5]]
				);
			}
			rotate([180,0,0]) cylinder(h = length, d = dimensions[21], center = false);
		}
	}
}

// Definitions from ISO 225 — Fasteners — Bolts, screws, studs and
// nuts — Symbols and descriptions of dimensions
//
// For a given d:
// 0:P: pitch of the thread
// 1:a max: maximum distance from the bearing face to the first full form (full profile) thread (screw)
// 2:a min: minimum distance from the bearing face to the first full form (full profile) thread (screw)
// 3:c max: maximum height of the washer-faced portion or thickness of the flange or collar
// 4:c min: minimum height of the washer-faced portion or thickness of the flange or collar
// 5:da max: maximum inner diameter of the bearing face
// 6:dw grade a min: minimum outer diameter of the washer face (bearing face)
// 7:dw grade b min: minimum outer diameter of the washer face (bearing face)
// 8:e grade a min: minimum width across corners
// 9:e grade b min: minimum width across corners
// 10:k nom: nominal height of the head
// 11:k grade a max: maximum height of the head
// 12:k grade a min: minimum height of the head
// 13:k grade b max: maximum height of the head
// 14:k grade b min: minimum height of the head
// 15:kw grade a: wrenching height
// 16:kw grade b: wrenching height
// 17:r min: minimum radius of curvature under head
// 18:s nom: nominal width across flats
// 19:s grade a min: minimum width across flats
// 20:s grade b min: minimum width across flats
// 21:d:basic major diameter (nominal diameter) of thread
function iso_hexagon_head_screw_dimensions(diameter) =
	diameter == "M1.6" ? [length_mm(0.35), length_mm(1.05), length_mm(0.35),
		length_mm(0.25), length_mm(0.10), length_mm(2), length_mm(2.27),
		length_mm(2.30), length_mm(3.41), length_mm(3.28), length_mm(1.1),
		length_mm(1.225), length_mm(0.975), length_mm(1.3), length_mm(0.9),
		length_mm(0.68), length_mm(0.63), length_mm(0.1), length_mm(3.20),
		length_mm(3.02), length_mm(2.90), length_mm(1.6)]:
	diameter == "M2" ? [4*length_mm, 12*length_mm, 4*length_mm]:
	diameter == "M2.5" ? [6*length_mm, 17*length_mm, 6*length_mm]:
	diameter == "M3" ? [25*length_mm, 52*length_mm, 15*length_mm]:
	diameter == "M4" ? [30*length_mm, 62*length_mm, 16*length_mm]:

  [8*length_mm, 22*length_mm, 7*length_mm]; // this is the default

iso_hexagon_head_screw("M1.6", 20, "A", true);
translate([5,0,0]) iso_hexagon_head_screw("M1.6", 20, "A", false);
translate([0,5,0]) iso_hexagon_head_screw("M1.6", 20, "B", true);
translate([5,5,0]) iso_hexagon_head_screw("M1.6", 20, "B", false);