// ========================================================================================
//  ApproxMVBB
//  Copyright (C) 2014 by Gabriel Nützi <nuetzig (at) imes (d0t) mavt (d0t) ethz
//  (døt) ch>
//
//  This Source Code Form is subject to the terms of the Mozilla Public
//  License, v. 2.0. If a copy of the MPL was not distributed with this
//  file, You can obtain one at http://mozilla.org/MPL/2.0/.
// ========================================================================================
#include <vtkAutoInit.h>
VTK_MODULE_INIT(vtkRenderingOpenGL);
VTK_MODULE_INIT(vtkInteractionStyle);
VTK_MODULE_INIT(vtkRenderingFreeType);
VTK_MODULE_INIT(vtkRenderingVolumeOpenGL);

#include <iostream>

#include "ApproxMVBB/ComputeApproxMVBB.hpp"

#include <pcl/io/pcd_io.h>
#include <pcl/console/time.h>
#include <pcl/visualization/pcl_visualizer.h>

pcl::console::TicToc timecal;

int main(int argc, char** argv)
{
    unsigned int nPoints = 10000;

    std::cout << "Sample " << nPoints << " points in unite cube (coordinates are in world coordinate system `I` ) " << std::endl;
    //ApproxMVBB::Matrix3Dyn points(3, nPoints);
    //points.setRandom();

	pcl::PointCloud<pcl::PointXYZ>::Ptr cloud(new pcl::PointCloud<pcl::PointXYZ>);
	pcl::PCDReader reader;
	reader.read("D:\\Github\\ApproxMVBB\\build\\x64\\Debug\\test.pcd", *cloud);

	ApproxMVBB::Matrix3Dyn points(3, cloud->size());
	for (int i = 0; i < cloud->size(); i++) {
		points.col(i) = ApproxMVBB::Vector3((*cloud)[i].x, (*cloud)[i].y, (*cloud)[i].z);
	}

	timecal.tic();
    ApproxMVBB::OOBB oobb = ApproxMVBB::approximateMVBB(points,
                                                        0.001,
                                                        500,
                                                        5, /*increasing the grid size decreases speed */
                                                        0,
                                                        5);
	std::cout << "ApproximateMVBB " << timecal.toc() << "ms" << std::endl;

    std::cout << "Computed OOBB: " << std::endl
              << "---> lower point in OOBB coordinate system: " << oobb.m_minPoint.transpose() << std::endl
              << "---> upper point in OOBB coordinate system: " << oobb.m_maxPoint.transpose() << std::endl
              << "---> coordinate transformation A_IK matrix from OOBB coordinate system `K`  "
                 "to world coordinate system `I` "
              << std::endl
              << oobb.m_q_KI.matrix() << std::endl
              << "---> this is also the rotation matrix R_KI  which turns the "
                 "world coordinate system `I`  into the OOBB coordinate system `K` "
              << std::endl
              << std::endl;

    // To make all points inside the OOBB :
    ApproxMVBB::Matrix33 A_KI = oobb.m_q_KI.matrix().transpose();  // faster to store the transformation matrix first
    auto size                 = points.cols();
    for(unsigned int i = 0; i < size; ++i)
    {
        oobb.unite(A_KI * points.col(i));
    }

    // To make the box have a minimum extent of greater 0.1:
    // see also oobb.expandToMinExtentRelative(...)
    oobb.expandToMinExtentAbsolute(0.1);

    std::cout << "OOBB with all point included: " << std::endl
              << "---> lower point in OOBB coordinate system: " << oobb.m_minPoint.transpose() << std::endl
              << "---> upper point in OOBB coordinate system: " << oobb.m_maxPoint.transpose() << std::endl;
	
	ApproxMVBB::OOBB::Vector3List corners = oobb.getCornerPoints();
	
	pcl::visualization::PCLVisualizer viewer;
	pcl::visualization::PointCloudColorHandlerCustom<pcl::PointXYZ> color_handler(cloud, 255, 255, 0); //输入的初始点云相关
	viewer.addPointCloud(cloud, color_handler, "cloud");
	/*for (auto& p : corners)
	{
		viewer.addSphere(pcl::PointXYZ(p.x(), p.y(), p.z()), 20, std::to_string(p.x()));
		std::cout << p.x() << " " << p.y() << " " << p.z() << std::endl;
	}*/
	for (int i = 0; i < corners.size(); i++)
	{
		for (int j = 0; j < corners.size(); j++) {

			if (i == j) continue;

			auto p = corners[i];
			auto q = corners[j];
			viewer.addLine(pcl::PointXYZ(p.x(), p.y(), p.z()), pcl::PointXYZ(q.x(), q.y(), q.z()), std::to_string(i) + "" + std::to_string(j));
		}
	}
	//viewer.addCube(bboxT, bboxQ, whd(0), whd(1), whd(2), "bbox");
	//viewer.setShapeRenderingProperties(pcl::visualization::PCL_VISUALIZER_REPRESENTATION, pcl::visualization::PCL_VISUALIZER_REPRESENTATION_WIREFRAME, "bbox");
	//viewer.setShapeRenderingProperties(pcl::visualization::PCL_VISUALIZER_COLOR, 1.0, 0.0, 0.0, "bbox");

	//viewer.addCoordinateSystem(0.5f*sc1);
	viewer.setBackgroundColor(0.0, 0.0, 0.0);
	while (!viewer.wasStopped())
	{
		viewer.spinOnce();
	}

    return 0;
}
